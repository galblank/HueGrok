//
//  HueControllerViewController.swift
//  HueGrok
//
//  Created by Gal Blank on 7/30/16.
//  Copyright © 2016 Gal Blank. All rights reserved.
//

import UIKit

class HueControllerViewController: UIViewController {

    var codingView:UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoimg = UIImage(named: "logo")
        let logo = UIImageView(frame: CGRect(x: view.frame.size.width - 120, y: 20, width:100, height:100))
        logo.image = logoimg
        view.addSubview(logo)
        
        let bulbimg = UIImage(named: "bulb")
        let bulb = UIImageView(frame: CGRect(x: 0, y: 20, width: bulbimg!.size.width, height: bulbimg!.size.height))
        bulb.image = bulbimg
        bulb.center.x = view.center.x
        view.addSubview(bulb)
        
        codingView = UITextView(frame: CGRect(x: 10, y: bulb.frame.origin.y + bulb.frame.size.height + 10, width: view.frame.size.width - 20, height: 200))
        codingView.layer.borderColor = UIColor.blackColor().CGColor
        codingView.font = UIFont(name: "HelveticaNeue", size: 25)
        codingView.text = "import Foundation\r\nimport UIKit\r\n\r\n"
        codingView.layer.borderWidth = 0.3
        codingView.layer.cornerRadius = 7.0
        self.view.addSubview(codingView)
        
        let playbutton = UIButton(type: .Custom)
        playbutton.frame = CGRect(x: view.frame.size.width - 150, y: codingView.frame.origin.y - 120, width: 100, height: 100)
        playbutton.setBackgroundImage(UIImage(named: "play"), forState: .Normal)
        view.addSubview(playbutton)
        
        /*let circleMain = UIView(frame: CGRect(x: 10, y: 10, width: view.frame.size.width - 20, height: view.frame.size.height - 20))
        circleMain.layer.borderColor = UIColor.blackColor().CGColor
        circleMain.layer.borderWidth = 0.5
        circleMain.layer.cornerRadius = view.frame.size.height / 2
        view.addSubview(circleMain)
        
        let circleMain2 = UIView(frame: CGRect(x: 70, y: 70, width: view.frame.size.width - 140, height: view.frame.size.height - 140))
        circleMain2.layer.borderColor = UIColor.blackColor().CGColor
        circleMain2.layer.borderWidth = 0.5
        circleMain2.layer.cornerRadius = view.frame.size.height / 2
        view.addSubview(circleMain2)

        addCircleWithColor(UIColor.redColor())
        addCircleWithColor(UIColor.yellowColor())
        addCircleWithColor(UIColor.greenColor())
        addCircleWithColor(UIColor.blueColor())*/
        

    }

    
    func addCircleWithColor(color:UIColor){
        let cirModel = CircleModel(_x: 20, _y: 20, _radius: 100, _color: color)
        let circle = Circle(cirmodel:cirModel )
        view.addSubview(circle)
        
        let move = UIPanGestureRecognizer(target: self, action: #selector(HueControllerViewController.handlePan(_:)))
        circle.addGestureRecognizer(move)
    }
    
    func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizerState.Began || gestureRecognizer.state == UIGestureRecognizerState.Changed {
            
            let translation = gestureRecognizer.translationInView(self.view)
            // note: 'view' is optional and need to be unwrapped
            gestureRecognizer.view!.center = CGPointMake(gestureRecognizer.view!.center.x + translation.x, gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPointMake(0,0), inView: self.view)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
