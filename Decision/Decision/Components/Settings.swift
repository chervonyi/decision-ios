//
//  Settings.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/15/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation
import UIKit

class Settings {
    
    enum Language {
        case ENGLISH
        case RUSSIAN
        case UKRAINIAN
        
        var string: String {
            switch self {
                case .ENGLISH: return "ENGLISH"
                case .RUSSIAN: return "RUSSIAN"
                case .UKRAINIAN: return "UKRAINIAN"
            }
        }
        
        var languageIdentifier: String {
            switch self {
            case .ENGLISH: return "en"
            case .RUSSIAN: return "ru"
            case .UKRAINIAN: return "uk"
            }
        }
    }
    
    private static let KEY_LANGUAGE = "language"
    private static let KEY_LAST_STAGE = "last_stage"
    private static let preferences = UserDefaults.standard
    static let LANGUAGE_DEFAULT = Language.ENGLISH
    
    static var language: Language {
        get {
            if let loadedLanguage = preferences.string(forKey: KEY_LANGUAGE) {
                switch loadedLanguage {
                case "ENGLISH": return Language.ENGLISH
                case "RUSSIAN": return Language.RUSSIAN
                case "UKRAINIAN": return Language.UKRAINIAN
                default: return LANGUAGE_DEFAULT
                }
            }
            return LANGUAGE_DEFAULT
        }
        
        set {
            // Update app language
            preferences.set([newValue.languageIdentifier], forKey: "AppleLanguages")
            //preferences.synchronize()
            
            
            // Save to memory
            preferences.set(newValue.string, forKey: KEY_LANGUAGE)
            preferences.synchronize()
        }
    }
    
    static var lastStage: String {
        get {
            return preferences.string(forKey: KEY_LAST_STAGE) ?? Plot.FIRST_STAGE
        }
        
        set {
            preferences.set(newValue, forKey: KEY_LAST_STAGE)
            preferences.synchronize()
        }
    }
    

    static func clear() {
        preferences.removeObject(forKey: KEY_LANGUAGE)
        preferences.removeObject(forKey: KEY_LAST_STAGE)
    }
    
    
}


