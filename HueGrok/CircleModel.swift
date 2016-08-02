//
//  CircleModel.swift
//  HueGrok
//
//  Created by Gal Blank on 7/30/16.
//  Copyright © 2016 Gal Blank. All rights reserved.
//

import UIKit

class CircleModel: NSObject {

    var coordinateX:CGFloat = 0
    var coordinateY:CGFloat = 0
    var radius:CGFloat = 0
    var color:UIColor = UIColor.yellowColor()
    
    init(_x:CGFloat, _y:CGFloat, _radius:CGFloat, _color:UIColor) {
        super.init()
        coordinateX = _x
        coordinateY = _y
        radius = _radius
        color = _color
    }
    
}
