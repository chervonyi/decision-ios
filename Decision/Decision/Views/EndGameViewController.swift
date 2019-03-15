//
//  EndGameViewController.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {

    @IBOutlet weak var buttonRestart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonRestart.layer.masksToBounds = true
        buttonRestart.layer.cornerRadius = 5
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EndGameViewController.onTouchRestart))
        buttonRestart.addGestureRecognizer(gestureRecognizer)
    }

    @objc func onTouchRestart(gestureRecognizer: UITapGestureRecognizer) {
        Plot.instance.restart()
        let firstStage = Plot.instance.getActiveStage()
        
        if firstStage.type == Stage.Types.CHAPTER {
            performSegue(withIdentifier: "toChapter", sender: nil)
        }
    }
}
