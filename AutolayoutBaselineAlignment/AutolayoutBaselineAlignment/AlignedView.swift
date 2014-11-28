//
//  AlignedView.swift
//  AutolayoutBaselineAlignment
//
//  Created by Tom Adriaenssen on 27/11/14.
//  Copyright (c) 2014 Tom Adriaenssen. All rights reserved.
//

import UIKit

class AlignedView: UIView {
    var alignmentIndex: Int = 2

    override func awakeFromNib() {
        alignmentIndex = Int(arc4random()) % subviews.count
    }

    override func viewForBaselineLayout() -> UIView? {
        if (alignmentIndex < 0 || alignmentIndex >= subviews.count) {
            return self
        }
        
        return viewWithTag(1 + alignmentIndex)?.subviews.first as? UIView
    }
}
