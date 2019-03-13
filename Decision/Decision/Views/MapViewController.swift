//
//  MapViewController.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var blockChoice1: UILabel!
    @IBOutlet weak var blockChoice2: UILabel!
    @IBOutlet weak var blockChoice3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set padding
        blockChoice1.padding =  UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        blockChoice2.padding =  UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        blockChoice3.padding =  UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        // Set round corners
        blockChoice1.layer.masksToBounds = true
        blockChoice1.layer.cornerRadius = 10
        blockChoice2.layer.masksToBounds = true
        blockChoice2.layer.cornerRadius = 10
        blockChoice3.layer.masksToBounds = true
        blockChoice3.layer.cornerRadius = 10
        
        // Enable multilines
        blockChoice1.numberOfLines = 0
        blockChoice2.numberOfLines = 0
        blockChoice3.numberOfLines = 0
    }
    

}
