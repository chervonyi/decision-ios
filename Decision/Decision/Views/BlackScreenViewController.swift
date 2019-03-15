//
//  BlackScreenViewController.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class BlackScreenViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let stage = Plot.instance.getActiveStage()
        
        labelText.text = stage.text.first!
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ChapterViewController.tapScreen))
        labelText.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func tapScreen(gestureRecognizer: UIGestureRecognizer) {
        performSegue(withIdentifier: "toEnd", sender: nil)
    }
}
