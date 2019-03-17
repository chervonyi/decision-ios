//
//  ScenarioXMLParser.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/14/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation


class ScenarioXMLParser: NSObject, XMLParserDelegate {

    private var accessToData = false
    private var currentElement: String!
    private var stage: Stage!
    static private(set) var plot: [String : Stage]!
    private var body = ""
    private var isNewStage = true
    
    static func loadScenario(baseOn plot: [String : Stage], in file: String) -> [String : Stage] {
        ScenarioXMLParser.plot = plot
        
        let path = Bundle.main.path(forResource: file, ofType: "xml")
        if path != nil {
            if let parser = XMLParser(contentsOf: NSURL(fileURLWithPath: path!) as URL) {
                let deviceParser = ScenarioXMLParser()
                parser.delegate = deviceParser
                parser.parse()
            }
        }
        return ScenarioXMLParser.plot
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        if ["id","number","title", "block", "image", "choice"].contains(elementName) {
            accessToData = true
            body = ""
        }
        
        if elementName == "stage" {
            isNewStage = true
        }
        
        // Clear blocks that work with 'append' func (below)
        if elementName == "text" {
            stage.text.removeAll()
        } else if elementName == "choice" && isNewStage {
            stage.choices.removeAll()
            isNewStage = false
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        switch elementName {
            case "stage": ScenarioXMLParser.plot.updateValue(stage, forKey: stage.ID!)
            case "id": stage = ScenarioXMLParser.plot[body]
            case "number": stage.number = body
            case "title": stage.title = body
            case "block": stage.text.append(body)
            case "image": stage.image = body
            case "choice": stage.choices.append(body)
            default: break
        }
    
        accessToData = false
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if accessToData {
            body += string
        }
    }

}
