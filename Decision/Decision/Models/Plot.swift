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
        
        loadScenario()
    }
    
    func loadScenario() {
        
        var selectedLanguage: String!
        
        switch Settings.language {
            case Settings.Language.ENGLISH: selectedLanguage = "scenario_en"
            case .RUSSIAN: selectedLanguage = "scenario_ru"
            case .UKRAINIAN: selectedLanguage = "scenario_uk"
        }
        
        vault = ScenarioXMLParser.loadScenario(baseOn: vault, in: selectedLanguage)
    }
    
    func getStage(by id: String) -> Stage {
        lastStageId = id
        Settings.lastStage = id
        return vault[id] ?? Stage()
    }
    
    func lookAtNextStage(by id: String) -> Stage {
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
