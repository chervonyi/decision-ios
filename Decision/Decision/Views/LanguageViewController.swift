//
//  LanguageViewController.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController {

    @IBOutlet weak var buttonLanguageEng: UIButton!
    @IBOutlet weak var buttonLanguageRus: UIButton!
    @IBOutlet weak var buttonLanguageUkr: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonLanguageEng.layer.masksToBounds = true
        buttonLanguageEng.layer.cornerRadius = 5
        buttonLanguageRus.layer.masksToBounds = true
        buttonLanguageRus.layer.cornerRadius = 5
        buttonLanguageUkr.layer.masksToBounds = true
        buttonLanguageUkr.layer.cornerRadius = 5
    }

    @IBAction func onSelectLanguage(_ sender: UIButton) {
        
        switch sender {
            case buttonLanguageEng: Settings.language = .ENGLISH
            case buttonLanguageRus: Settings.language = .RUSSIAN
            case buttonLanguageUkr: Settings.language = .UKRAINIAN
            default: break
        }
        
        // Update scenarion with new language
        Plot.instance.loadScenario()
        
        let pausedStage = Plot.instance.getActiveStage()
        
        // Replace segue with Restart of app (IF LANGUAGE WILL NOT BE CHANGE ON AIR)
        if pausedStage.type == Stage.Types.MAP {
            performSegue(withIdentifier: "toMap", sender: nil)
        } else {
            performSegue(withIdentifier: "toStage", sender: nil)
        }
    }
}
