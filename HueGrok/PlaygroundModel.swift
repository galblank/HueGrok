//
//  PlaygroundModel.swift
//  HueGrok
//
//  Created by Gal Blank on 8/2/16.
//  Copyright © 2016 Gal Blank. All rights reserved.
//

import UIKit

enum displayType:Int32{
    case carusel   = 1
    case singleImage = 2
    case table = 3
    case pagingview = 4
}

class PlaygroundModel: NSObject {
    var imageArray:[UIImage]? = nil
    var dispType:displayType = .singleImage
    var title:String = ""
    
    init(display:displayType, images:[UIImage]?, mainTitle:String)
    {
        
    }
}
