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

        buttonContinue.layer.masksToBounds = true
        buttonContinue.layer.cornerRadius = 5
        buttonRestart.layer.masksToBounds = true
        buttonRestart.layer.cornerRadius = 5
        buttonChangeLanguage.layer.masksToBounds = true
        buttonChangeLanguage.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
