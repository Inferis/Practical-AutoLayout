//
//  ViewController.swift
//  AlignmentRectExamples
//
//  Created by Tom Adriaenssen on 27/11/14.
//  Copyright (c) 2014 Tom Adriaenssen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var badgedView: BadgedView!
    @IBOutlet var decoratedView: DecoratedView!

    @IBAction func toggle(sender: UIButton) {
        if (badgedView.aligned) {
            badgedView.aligned = false
            decoratedView.aligned = false
            sender.setTitle("Use alignment rects", forState: .Normal)
        }
        else {
            badgedView.aligned = true
            decoratedView.aligned = true
            sender.setTitle("No alignment rects", forState: .Normal)
        }
        
        view.setNeedsLayout()
        UIView.animateWithDuration(0.3, animations: {
            self.view.layoutIfNeeded()
        })
    }

}

