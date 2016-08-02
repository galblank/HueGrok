//
//  PredictionEngine.swift
//  techNuclues-iOS-Swift
//
//  Created by Blank, Gal (Contractor) on 7/21/16.
//  Copyright © 2016 Comcast. All rights reserved.
//

import UIKit

class PredictionEngine: NSObject {
    var currentlyMatched = false
    static let sharedInstance:PredictionEngine = PredictionEngine()
    var predictionArray:NSMutableArray = NSMutableArray()
    override init() {
        super.init()
        if(predictionArray.count == 0){
            if let path = NSBundle.mainBundle().pathForResource("PredictionDictionary", ofType: "plist") {
                predictionArray = NSMutableArray(array: NSArray(contentsOfFile: path)!)
                NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(PredictionEngine.messageHandler(_:)), name: "matchtext", object: nil)
            }
        }
    }
    
    func messageHandler(notif:NSNotification)
    {
        let text = notif.userInfo!["text"] as! String
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            // do some task
            var matched = self.searchformatches(text) as! [String:AnyObject]
            if(matched.count > 0){
                dispatch_async(dispatch_get_main_queue()) {
                    NSNotificationCenter.defaultCenter().postNotificationName("internal.matchedtext", object: nil, userInfo:matched as [NSObject : AnyObject])
                }
            }
            else if(self.currentlyMatched == true){
                self.currentlyMatched = false
                dispatch_async(dispatch_get_main_queue()) {
                    NSNotificationCenter.defaultCenter().postNotificationName("internal.unmatchedtext", object: nil, userInfo:nil)
                }
            }
        }
        

    }
    
    func searchformatches(text:String) -> NSDictionary
    {
        var match:NSDictionary = NSDictionary()
        for item in predictionArray{
            print(item)
            for key in (item as! NSDictionary).allKeys{
                let arrayofValues = (item as! NSDictionary).objectForKey(key) as! NSArray
                for value in arrayofValues{
                    let index = text.lowercaseString.rangeOfString(((value as! String).lowercaseString), options: NSStringCompareOptions.BackwardsSearch)
                    if(index != nil){
                        let replaceOnly = text.lowercaseString.substringFromIndex((index?.startIndex)!)
                        match = ["text":key as! String,"index":text.startIndex.distanceTo((index?.startIndex)!),"replace":replaceOnly]
                        currentlyMatched = true
                        break
                    }
                }
            }
        }
        
        return match
    }
    
    
}
