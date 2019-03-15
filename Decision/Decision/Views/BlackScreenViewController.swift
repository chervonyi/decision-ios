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
        
        var text = stage.text.first!
        text = text.replacingOccurrences(of: "\\n", with: "\n")
        text = text.replacingOccurrences(of: "\\t\\t", with: "\t")
        
        labelText.text = text
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BlackScreenViewController.touchScreen))
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func touchScreen(gestureRecognizer: UIGestureRecognizer) {
        performSegue(withIdentifier: "toEnd", sender: nil)
    }
}
