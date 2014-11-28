//
//  BadgedView.swift
//  AlignmentRectExamples
//
//  Created by Tom Adriaenssen on 27/11/14.
//  Copyright (c) 2014 Tom Adriaenssen. All rights reserved.
//

import UIKit

class BadgedView: UIView {
    var aligned : Bool = false {
        didSet {
            setNeedsLayout()
        }
    }

    override func alignmentRectInsets() -> UIEdgeInsets {
        return aligned ? UIEdgeInsetsMake(-10, 0, 0, -10) : UIEdgeInsetsZero
    }

}
