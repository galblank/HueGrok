//
//  Circle.swift
//  HueGrok
//
//  Created by Gal Blank on 7/30/16.
//  Copyright © 2016 Gal Blank. All rights reserved.
//

import UIKit

class Circle: UIView {
    var circlemodel:CircleModel!
    
    
    override init (frame : CGRect) {
        super.init(frame : frame)
    }

    
    convenience init(cirmodel:CircleModel){
        self.init(frame:CGRect.zero)
        circlemodel = cirmodel
        frame = CGRect(x: circlemodel.coordinateX , y: circlemodel.coordinateY, width: circlemodel.radius, height: circlemodel.radius)
        layer.cornerRadius = CGFloat(circlemodel.radius / 2)
        backgroundColor = circlemodel.color
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
