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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUIProperties()
        
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
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StageViewController.touchMainTextBlock))
        mainBlockText.addGestureRecognizer(gestureRecognizer)
    }
    
    
    @objc func touchMainTextBlock(gestureRecognizer: UIGestureRecognizer) {
        mainBlockText.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. \n\t\tLorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        
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
