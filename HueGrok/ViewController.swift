//
//  ViewController.swift
//  HueGrok
//
//  Created by Gal Blank on 7/30/16.
//  Copyright © 2016 Gal Blank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        
        
        let startbutton = UIButton(type: .Custom)
        let logoimg = UIImage(named: "logo")
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: logoimg!.size.width, height: logoimg!.size.height))
        logo.image = logoimg
        logo.center = view.center
        logo.center.y = logo.center.y - 100
        
        startbutton.frame = logo.frame
        startbutton.setBackgroundImage(logoimg, forState: .Normal)
        startbutton.addTarget(self, action: #selector(ViewController.go), forControlEvents: .TouchUpInside)
        
        view.addSubview(startbutton)
        
        let hueimg = UIImage(named: "hue")
        let hue = UIImageView(frame: CGRect(x: 0, y: 0, width: hueimg!.size.width, height: hueimg!.size.height))
        hue.image = hueimg
        hue.center = view.center
        hue.center.y = view.frame.size.height
        view.addSubview(hue)
        UIView.animateWithDuration(1.5) {
            hue.center.y = logo.center.y + ((hueimg?.size.height)!)
        }
        
        
    }
    
    func go()
    {
        let hc = HueControllerViewController()
        self.navigationController?.pushViewController(hc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

