//
//  PlotXMLParser.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class PlotXMLParser: NSObject, XMLParserDelegate {
    
    private static var plot = [String:Stage]()
    private var accessToData = false
    private var stage: Stage!
    private var currentElement: String!
    
    static func loadPlotFromXML() -> [String:Stage] {
        let path = Bundle.main.path(forResource: "plot", ofType: "xml")
        if path != nil {
            if let parser = XMLParser(contentsOf: NSURL(fileURLWithPath: path!) as URL) {
                let deviceParser = PlotXMLParser()
                parser.delegate = deviceParser
                parser.parse()
                
                return PlotXMLParser.plot
            }
        }
        return [String:Stage]()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        if elementName == "stage" {
            stage = Stage()
            stage.type = stage.getType(from: attributeDict["type"]!)
        } else if elementName == "id" ||
            elementName == "next" {
            accessToData = true
            currentElement = elementName
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "stage" {
            
            PlotXMLParser.plot[stage.ID!] = stage
        } else if elementName == "id" ||
            elementName == "next" {
            accessToData = false
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if accessToData {
            if currentElement == "id" {
                stage.ID = string
            } else if currentElement == "next" {
                if stage.type == Stage.Types.SIMPLE ||
                    stage.type == Stage.Types.CHAPTER ||
                    stage.type == Stage.Types.BLACK_SCREEN {
                    stage.nextID = string
                } else {
                    stage.nextIDForChoices.append(string)
                }
            }
        }
    }
}







