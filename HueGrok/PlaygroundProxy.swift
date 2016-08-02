//
//  PlaygroundProxy.swift
//  HueGrok
//
//  Created by Gal Blank on 7/31/16.
//  Copyright © 2016 Gal Blank. All rights reserved.
//

import Foundation
import UIKit

func addbulb() -> UIImageView
{
    let bulbimg = UIImage(named: "bulb")
    let bulb = UIImageView(frame: CGRect(x: 0, y: 0, width: bulbimg!.size.width, height: bulbimg!.size.height))
    bulb.image = bulbimg
    //bulb.center = view.center
    //bulb.center.y = bulb.center.y
    //view.addSubview(bulb)
    
    return bulb
}
