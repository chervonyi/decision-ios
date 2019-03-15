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
    
    static let FIRST_STAGE = "AA000"
    
    private var _startStage: String?
    
    var startStage: String {
        get {
            return _startStage ?? Plot.FIRST_STAGE
        }
        
        set {
            _startStage = newValue
        }
    }
    
    private(set) var lastStageId: String! = Plot.FIRST_STAGE
    
    func loadXMLFiles() {
        vault = PlotXMLParser.loadPlotFromXML()
        // TODO read appropriate file
        vault = ScenarioXMLParser.loadScenario(baseOn: vault, in: "scenario_en")
    }
    
    func getStage(by id: String) -> Stage {
        lastStageId = id
        Settings.lastStage = id
        return vault[id] ?? Stage()
    }
    
    func getActiveStage() -> Stage {
        return getStage(by: lastStageId)
    }
    
    func restart() {
        lastStageId = Plot.FIRST_STAGE
    }
    
    private init() { }
}
