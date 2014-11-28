//
//  DecoratedView.swift
//  AlignmentRectExamples
//
//  Created by Tom Adriaenssen on 27/11/14.
//  Copyright (c) 2014 Tom Adriaenssen. All rights reserved.
//

import UIKit

class DecoratedView: UIView {
    var aligned : Bool = false {
        didSet {
            setNeedsLayout()
            self.superview?.setNeedsLayout() // this sucks, but is necessary
        }
    }

    override func alignmentRectInsets() -> UIEdgeInsets {
        return aligned ? UIEdgeInsetsMake(20, 20, 20, 20) : UIEdgeInsetsZero
    }
}
