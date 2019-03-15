//
//  ChapterViewController.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class ChapterViewController: UIViewController {

    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    private var stage: Stage! {
        didSet {
            labelNumber.text = stage.number
            labelTitle.text = stage.title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stage = Plot.instance.getActiveStage()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ChapterViewController.tapScreen))
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func tapScreen(gestureRecognizer: UIGestureRecognizer) {
        let nextStage = Plot.instance.getStage(by: stage.nextID!)
        
        if nextStage.type == Stage.Types.SIMPLE ||
            nextStage.type == Stage.Types.CHOICE {
            performSegue(withIdentifier: "toStage", sender: nil)
        }
    }
}
