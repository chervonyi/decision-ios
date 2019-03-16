//
//  SettingsViewController.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var buttonContinue: UIButton!
    @IBOutlet weak var buttonRestart: UIButton!
    @IBOutlet weak var buttonChangeLanguage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUIProperties()
        
        var gustureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SettingsViewController.onTouchContinue))
        buttonContinue.addGestureRecognizer(gustureRecognizer)
        
        gustureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SettingsViewController.onTouchRestart))
        buttonRestart.addGestureRecognizer(gustureRecognizer)
        
        gustureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SettingsViewController.onTouchChangeLanguage))
        buttonChangeLanguage.addGestureRecognizer(gustureRecognizer)
    }

    
    @objc func onTouchContinue(gestureRecognizer: UIGestureRecognizer) {
        let nextStage = Plot.instance.getActiveStage()
        
        if nextStage.type == Stage.Types.MAP {
            performSegue(withIdentifier: "toMap", sender: nil)
        } else {
            performSegue(withIdentifier: "toStage", sender: nil)
        }
    }
    
    @objc func onTouchRestart(gestureRecognizer: UIGestureRecognizer) {
        Plot.instance.restart()
        performSegue(withIdentifier: "toChapter", sender: nil)
    }
    
    @objc func onTouchChangeLanguage(gestureRecognizer: UIGestureRecognizer) {
        performSegue(withIdentifier: "toLanguage", sender: nil)
    }
    
    func setUIProperties() {
        buttonContinue.layer.masksToBounds = true
        buttonContinue.layer.cornerRadius = 5
        buttonRestart.layer.masksToBounds = true
        buttonRestart.layer.cornerRadius = 5
        buttonChangeLanguage.layer.masksToBounds = true
        buttonChangeLanguage.layer.cornerRadius = 5
    }
}
