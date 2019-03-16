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
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var buttonSettings: UIImageView!
    
    var stage: Stage! {
        didSet {
            
            backgroundImage.image = UIImage(named: stage.image!)
            
            blockChoice1.text = stage.choices[0]
            blockChoice2.text = stage.choices[1]
            
            if stage.hasThreeChoices {
                blockChoice3.text = stage.choices[2]
                blockChoice3.isHidden = false
            } else {
                blockChoice3.isHidden = true
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stage = Plot.instance.getActiveStage()
        
        setUIProperties()
        
        var gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MapViewController.onTouchChoice1))
        blockChoice1.addGestureRecognizer(gestureRecognizer)
        
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MapViewController.onTouchChoice2))
        blockChoice2.addGestureRecognizer(gestureRecognizer)
        
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MapViewController.onTouchChoice3))
        blockChoice3.addGestureRecognizer(gestureRecognizer)
        
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MapViewController.onTouchSettings))
        buttonSettings.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func onTouchSettings(gestureRecognizer: UIGestureRecognizer) {
        performSegue(withIdentifier: "toSettings", sender: nil)
    }
    
    @objc func onTouchChoice1(gestureRecognizer: UIGestureRecognizer) {
        moveTo(next: stage.nextIDForChoices[0])
    }
    
    @objc func onTouchChoice2(gestureRecognizer: UIGestureRecognizer) {
        moveTo(next: stage.nextIDForChoices[1])
    }
    
    @objc func onTouchChoice3(gestureRecognizer: UIGestureRecognizer) {
        moveTo(next: stage.nextIDForChoices[2])
    }
    
    func moveTo(next stageID: String) {
        let nextStage = Plot.instance.getStage(by: stageID)
        
        if nextStage.type == Stage.Types.SIMPLE ||
            nextStage.type == Stage.Types.CHOICE {
            performSegue(withIdentifier: "toStage", sender: nil)
        }
    }
    
    func setUIProperties(){
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
