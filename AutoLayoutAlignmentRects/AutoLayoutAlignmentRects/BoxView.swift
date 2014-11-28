//
//  BoxView.swift
//  AutoLayoutAnimation
//
//  Created by Tom Adriaenssen on 27/11/14.
//
//

import UIKit

class BoxView: UIView {
    @IBOutlet var insetsLabel : UILabel!
    var rectLayer : CALayer!
    
    var insets = UIEdgeInsetsZero
    var crazy : Bool = false {
        didSet {
            if (crazy) {
                let l : Int = arc4random() % 100 - 50
                let t : Int = arc4random() % 100 - 50
                let r : Int = arc4random() % 100 - 50
                let b : Int = arc4random() % 100 - 50
                insets = UIEdgeInsetsMake(CGFloat(t), CGFloat(l), CGFloat(r), CGFloat(b))
                insetsLabel.text = NSStringFromUIEdgeInsets(insets)
            }
            else {
                insets = UIEdgeInsetsZero
                insetsLabel.text = ""
            }
            setNeedsLayout()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        insetsLabel.text = ""
        
        rectLayer = CALayer()
        rectLayer.borderColor = UIColor.greenColor().CGColor
        rectLayer.borderWidth = 1
        layer.addSublayer(rectLayer)
    }

    override func alignmentRectInsets() -> UIEdgeInsets {
        return insets
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rectLayer.frame = UIEdgeInsetsInsetRect(bounds, insets)
    }
    
}
