//
//  ViewController.swift
//  AutoLayoutAnimation
//
//  Created by Tom Adriaenssen on 27/11/14.
//
//

import UIKit

enum Mode {
    case None
    case ExpandHorizontal
    case ExpandVertical
    case PinTop
    case PinLeft
    case PinRight
    case PinBottom
}

class ViewController: UIViewController {
    var mode = Mode.None
    var constraint: NSLayoutConstraint?
    @IBOutlet var boxView: BoxView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func normal() {
        mode = .None
        self.animateUpdateViewConstraints()
    }

    @IBAction func crazy(sender: UIButton) {
        if (self.boxView.crazy) {
            sender.setTitle("Crazy", forState: .Normal)
            self.boxView.crazy = false
        }
        else {
            sender.setTitle("Uncrazy", forState: .Normal)
            self.boxView.crazy = true
        }
        self.animateUpdateViewConstraints()
    }
    
    @IBAction func expandHorizontally() {
        mode = .ExpandHorizontal
        self.animateUpdateViewConstraints()
    }
    
    @IBAction func expandVertically() {
        mode = .ExpandVertical
        self.animateUpdateViewConstraints()
    }

    @IBAction func pinLeft() {
        mode = .PinLeft
        self.animateUpdateViewConstraints()
    }
    
    @IBAction func pinRight() {
        mode = .PinRight
        self.animateUpdateViewConstraints()
    }

    @IBAction func pinTop() {
        mode = .PinTop
        self.animateUpdateViewConstraints()
    }

    @IBAction func pinBottom() {
        mode = .PinBottom
        self.animateUpdateViewConstraints()
    }

    func animateUpdateViewConstraints() {
        self.updateViewConstraints()
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: CGFloat(0.7), initialSpringVelocity: CGFloat(0.9), options: .allZeros, animations: {
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()

        if let constraint = self.constraint {
            self.view.removeConstraint(constraint)
            self.constraint = nil
        }
        
        switch (mode) {
        case .ExpandHorizontal:
            self.constraint = NSLayoutConstraint(item: self.boxView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 0.92, constant: 0)
        case .ExpandVertical:
            self.constraint = NSLayoutConstraint(item: self.boxView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Height, multiplier: 0.95, constant: 0)
        case .PinTop:
            self.constraint = NSLayoutConstraint(item: self.boxView, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.TopMargin, multiplier: 1, constant: 30)
        case .PinBottom:
            self.constraint = NSLayoutConstraint(item: self.boxView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -10)
        case .PinLeft:
            self.constraint = NSLayoutConstraint(item: self.boxView, attribute: NSLayoutAttribute.LeftMargin, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.LeftMargin, multiplier: 1, constant: 0)
        case .PinRight:
            self.constraint = NSLayoutConstraint(item: self.boxView, attribute: NSLayoutAttribute.RightMargin, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.RightMargin, multiplier: 1, constant: 0)
        default:
            break
        }
        
        if let constraint = self.constraint {
            self.view.addConstraint(constraint)
        }
        
        self.boxView.setNeedsLayout()
    }

}

