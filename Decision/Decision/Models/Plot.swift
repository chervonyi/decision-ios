//
//  Plot.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/14/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation


class Plot {
    static let instance = Plot()
    
    private(set) var vault: [String : Stage]!
    
    func loadXMLFiles() {
        vault = PlotXMLParser.loadPlotFromXML()
        // TODO read appropriate file
        vault = ScenarioXMLParser.loadScenario(baseOn: vault, in: "scenario_en")
    }
    
    private init() { }
}
