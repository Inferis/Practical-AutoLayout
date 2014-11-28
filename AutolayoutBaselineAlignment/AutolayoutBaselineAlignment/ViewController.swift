//
//  ViewController.swift
//  AutolayoutBaselineAlignment
//
//  Created by Tom Adriaenssen on 27/11/14.
//  Copyright (c) 2014 Tom Adriaenssen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var alignedView : AlignedView!
    @IBOutlet var label : UILabel!
    var constraint: NSLayoutConstraint?
    
    @IBAction func align(sender: UIButton) {
        alignedView.alignmentIndex = sender.tag - 10
        self.view.setNeedsLayout()
        self.view.setNeedsUpdateConstraints()
        UIView.animateWithDuration(0.3, animations: {
            self.view.updateConstraintsIfNeeded()
            self.view.layoutIfNeeded()
        })
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()

        if let constraint = self.constraint {
            view.removeConstraint(constraint)
        }
        let constraint = NSLayoutConstraint(item: alignedView, attribute: .Baseline, relatedBy: .Equal, toItem: label, attribute: .Baseline, multiplier: 1, constant: 0)
        self.view.addConstraint(constraint)
    }

}

