//
//  StageViewController.swift
//  Decision
//
//  Created by Yuri Chervonyi on 3/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class StageViewController: UIViewController {

    @IBOutlet weak var mainBlockText: UILabel!
    @IBOutlet weak var blockChoice1: UILabel!
    @IBOutlet weak var blockChoice2: UILabel!
    @IBOutlet weak var blockChoice3: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    private var numberOfBlock = 0
    
    private var stage: Stage! {
        didSet {
            numberOfBlock = 0
            changeTextBox()
            
            backgroundImage.image = UIImage(named: stage.image!)
            
            blockChoice1.isHidden = true
            blockChoice2.isHidden = true
            blockChoice3.isHidden = true
            
            if stage.type == Stage.Types.CHOICE {
                blockChoice1.text = stage.choices[0]
                blockChoice2.text = stage.choices[1]
                
                if stage.hasThreeChoices {  blockChoice3.text = stage.choices[2] }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUIProperties()
        
        stage = Plot.instance.getActiveStage()
        
        var gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StageViewController.touchMainTextBlock))
        mainBlockText.addGestureRecognizer(gestureRecognizer)
        
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StageViewController.touchChoice1))
        blockChoice1.addGestureRecognizer(gestureRecognizer)
        
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StageViewController.touchChoice2))
        blockChoice2.addGestureRecognizer(gestureRecognizer)
        
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StageViewController.touchChoice3))
        blockChoice3.addGestureRecognizer(gestureRecognizer)
    }

    func changeTextBox() {
        var text = stage.text[numberOfBlock]
        text = text.replacingOccurrences(of: "\\n", with: "\n")
        text = text.replacingOccurrences(of: "\\t\\t", with: "\t")
        mainBlockText.text = text
        numberOfBlock += 1
        
        if numberOfBlock == stage.text.count && stage.type == Stage.Types.CHOICE {
            blockChoice1.isHidden = false
            blockChoice2.isHidden = false
            
            if stage.hasThreeChoices { blockChoice3.isHidden = false }
        }
    }
    
    func setUIProperties() {
        // Set padding
        mainBlockText.padding =  UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        blockChoice1.padding =  UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        blockChoice2.padding =  UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        blockChoice3.padding =  UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        // Set rounded coreners
        blockChoice1.layer.masksToBounds = true
        blockChoice1.layer.cornerRadius = 20
        blockChoice2.layer.masksToBounds = true
        blockChoice2.layer.cornerRadius = 20
        blockChoice3.layer.masksToBounds = true
        blockChoice3.layer.cornerRadius = 20
        
        // Enable multilines
        mainBlockText.numberOfLines = 0
        blockChoice1.numberOfLines = 0
        blockChoice2.numberOfLines = 0
        blockChoice3.numberOfLines = 0
    }
    
    
    @objc func touchMainTextBlock(gestureRecognizer: UIGestureRecognizer) {
        
        if numberOfBlock < stage.text.count {
            changeTextBox()
        } else if numberOfBlock == stage.text.count && stage.type == Stage.Types.SIMPLE {
            moveTo(next: stage.nextID!)
        }
        
    }
    
    @objc func touchChoice1(gestureRecognizer: UIGestureRecognizer) {
        moveTo(next: stage.nextIDForChoices[0])
    }
    
    @objc func touchChoice2(gestureRecognizer: UIGestureRecognizer) {
        moveTo(next: stage.nextIDForChoices[1])
    }
    
    @objc func touchChoice3(gestureRecognizer: UIGestureRecognizer) {
        moveTo(next: stage.nextIDForChoices[0])
    }
    
    func moveTo(next stageID: String) {
        
        if stageID == "END" {
            performSegue(withIdentifier: "toEnd", sender: nil)
        }
        
        let nextStage = Plot.instance.getStage(by: stageID)
        
        switch nextStage.type! {
        case Stage.Types.SIMPLE, Stage.Types.CHOICE: stage = nextStage
        case Stage.Types.MAP: performSegue(withIdentifier: "toMap", sender: nil)
        case Stage.Types.CHAPTER: performSegue(withIdentifier: "toChapter", sender: nil)
        case Stage.Types.BLACK_SCREEN: performSegue(withIdentifier: "toBlackScreen", sender: nil)
        }
    }
}


extension UILabel {
    private struct AssociatedKeys {
        static var padding = UIEdgeInsets()
    }
    
    public var padding: UIEdgeInsets? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets!, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    override open func draw(_ rect: CGRect) {
        if let insets = padding {
            self.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
        } else {
            self.drawText(in: rect)
        }
    }
    
    override open var intrinsicContentSize: CGSize {
        guard let text = self.text else { return super.intrinsicContentSize }
        
        var contentSize = super.intrinsicContentSize
        var textWidth: CGFloat = frame.size.width
        var insetsHeight: CGFloat = 0.0
        
        if let insets = padding {
            textWidth -= insets.left + insets.right
            insetsHeight += insets.top + insets.bottom
        }
        
        let newSize = text.boundingRect(with: CGSize(width: textWidth, height: CGFloat.greatestFiniteMagnitude),
                                        options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                        attributes: [NSAttributedStringKey.font: self.font], context: nil)
        
        contentSize.height = ceil(newSize.size.height) + insetsHeight
        
        return contentSize
    }
}
