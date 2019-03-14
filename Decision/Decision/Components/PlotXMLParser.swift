//
//  PlotXMLParser.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class PlotXMLParser: NSObject, XMLParserDelegate {
    
    static func loadPlotFromXML() {
        let path = Bundle.main.path(forResource: "plot", ofType: "xml")
        if path != nil {
            if let parser = XMLParser(contentsOf: NSURL(fileURLWithPath: path!) as URL) {
                let deviceParser = PlotXMLParser()
                parser.delegate = deviceParser
                parser.parse()
                
                // Set loaded plot from xml to Plot class
            }
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
    }
}
