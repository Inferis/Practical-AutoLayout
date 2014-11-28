//
//  TestView.swift
//  IntrinsticContentSize
//
//  Created by Tom Adriaenssen on 27/11/14.
//  Copyright (c) 2014 Tom Adriaenssen. All rights reserved.
//

import UIKit

class TestView: UIView {

    override func intrinsicContentSize() -> CGSize {
        return CGSizeMake(100, 200)
    }
}
