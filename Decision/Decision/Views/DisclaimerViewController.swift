//
//  ViewController.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class DisclaimerViewController: UIViewController {

    @IBOutlet weak var labelLongInfo1: UILabel!
    @IBOutlet weak var labelLongInfo2: UILabel!
    @IBOutlet weak var labelTapInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Plot.instance.loadXMLFiles()
        
        labelLongInfo1.numberOfLines = 0
        labelLongInfo1.numberOfLines = 0
        labelTapInfo.numberOfLines = 0
        
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

