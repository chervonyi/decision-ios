//
//  Stage.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/14/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Stage {
    
    enum Types {
        case SIMPLE
        case CHAPTER
        case BLACK_SCREEN
        case MAP
        case CHOICE
    }
    
    var ID: String?
    var type: Types?
    var text = [String]()
    var choices = [String]()
    
    var nextID: String?
    var nextIDForChoices = [String]()
    
    var number: String?
    var title: String?
    
    var image: String?
    
    init() {
        
    }
    
    func getType(from string: String) -> Types? {
        switch string {
            case "simple": return Types.SIMPLE
            case "chapter": return Types.CHAPTER
            case "black": return Types.BLACK_SCREEN
            case "map": return Types.MAP
            case "choice": return Types.CHOICE
            default: return nil
        }
    }
}
