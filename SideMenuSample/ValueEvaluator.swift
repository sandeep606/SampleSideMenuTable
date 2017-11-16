//
//  ValueEvaluator.swift
//  SideMenuSample
//
//  Created by sandeep on 16/11/17.
//  Copyright © 2017 Evontech. All rights reserved.
//

import Foundation
import UIKit
// considering 6/6s size as idol
// calculating ratio on the basis of 6/6s device only.

let widthMultiplier : CGFloat = UIScreen.main.bounds.size.width/375
let heightMultiplier : CGFloat = UIScreen.main.bounds.size.height/667
let sideMenuVisibilityWidth :CGFloat = 320.0 * widthMultiplier
