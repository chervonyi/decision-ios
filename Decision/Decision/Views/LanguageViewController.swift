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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
