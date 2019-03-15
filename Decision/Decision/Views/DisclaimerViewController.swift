//
//  ViewController.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class DisclaimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Plot.instance.loadXMLFiles()
        
        // Load last stage from memory
        Plot.instance.startStage = Settings.lastStage
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DisclaimerViewController.tapScreen))
        self.view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func tapScreen(gestureRecognizer: UIGestureRecognizer) {
        let firstStage = Plot.instance.getStage(by: Plot.instance.startStage)
        
        switch firstStage.type! {
        case Stage.Types.SIMPLE, Stage.Types.CHOICE: performSegue(withIdentifier: "toStage", sender: nil)
        case Stage.Types.CHAPTER: performSegue(withIdentifier: "toChapter", sender: nil)
        case Stage.Types.BLACK_SCREEN: performSegue(withIdentifier: "toBlackScreen", sender: nil)
        case Stage.Types.MAP: performSegue(withIdentifier: "toMap", sender: nil)
        }
    }
    
    

}

