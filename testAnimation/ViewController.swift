//
//  ViewController.swift
//  testAnimation
//
//  Created by 薛焱 on 16/6/28.
//  Copyright © 2016年 薛焱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var screenWidth = UIScreen.mainScreen().bounds.width
    var screenHeight = UIScreen.mainScreen().bounds.height
    var shapeLayer = CAShapeLayer()
    var shapeLayer1 = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        addCircle()

    }
    
    func addCircle() {
        
        shapeLayer.frame = CGRect(x: screenWidth/2 - 50, y: screenHeight/2 - 50, width: 100, height: 100)
        shapeLayer.fillColor = UIColor.orangeColor().CGColor
        view.layer.addSublayer(shapeLayer)
        let path1 = UIBezierPath(ovalInRect: CGRect(x: 40, y: 40, width: 20, height: 20))
        let path2 = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: 100, height: 100))
        let path3 = UIBezierPath(ovalInRect: CGRect(x: 5, y: 0, width: 90, height: 100))
        let path4 = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: 100, height: 100))
        let path5 = UIBezierPath(ovalInRect: CGRect(x: 0, y: 5, width: 100, height: 90))
        let path6 = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: 100, height: 100))
        let animation = CAKeyframeAnimation(keyPath: "path")
        animation.values = [path1.CGPath, path2.CGPath, path3.CGPath, path4.CGPath, path5.CGPath, path6.CGPath, path3.CGPath, path4.CGPath, path5.CGPath, path6.CGPath];
        animation.duration = 1
        animation.beginTime = 0
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        shapeLayer.addAnimation(animation, forKey: nil)
        NSTimer.scheduledTimerWithTimeInterval(1, target:self , selector: #selector(addSanjiao), userInfo: nil, repeats: false)
    }
    
    func addSanjiao() {
        
        shapeLayer1.frame = CGRect(x: screenWidth/2 - 50, y: screenHeight/2 - 50, width: 100, height: 100)
        shapeLayer1.strokeColor = UIColor.orangeColor().CGColor
        shapeLayer1.fillColor = UIColor.orangeColor().CGColor
        shapeLayer1.lineJoin = kCALineJoinRound
        shapeLayer1.lineWidth = 10
        view.layer.addSublayer(shapeLayer1)
        let path11 = UIBezierPath()
        path11.moveToPoint(CGPoint(x: 50, y: 10))
        path11.addLineToPoint(CGPoint(x: 15, y: 75))
        path11.addLineToPoint(CGPoint(x: 85, y: 75))
        path11.closePath()
        let path12 = UIBezierPath()
        path12.moveToPoint(CGPoint(x: 50, y: 10))
        path12.addLineToPoint(CGPoint(x: -5, y: 75))
        path12.addLineToPoint(CGPoint(x: 85, y: 75))
        path12.closePath()
        let path13 = UIBezierPath()
        path13.moveToPoint(CGPoint(x: 50, y: 10))
        path13.addLineToPoint(CGPoint(x: -5, y: 75))
        path13.addLineToPoint(CGPoint(x: 105, y: 75))
        path13.closePath()
        let path14 = UIBezierPath()
        path14.moveToPoint(CGPoint(x: 50, y: -10))
        path14.addLineToPoint(CGPoint(x: -5, y: 75))
        path14.addLineToPoint(CGPoint(x: 105, y: 75))
        path14.closePath()
        
        let animation1 = CAKeyframeAnimation(keyPath: "path")
        animation1.values = [path11.CGPath, path12.CGPath, path13.CGPath, path14.CGPath];
        animation1.duration = 0.25
        animation1.removedOnCompletion = false
        animation1.fillMode = kCAFillModeForwards
        shapeLayer1.addAnimation(animation1, forKey: nil)
        NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: #selector(xuanzhuan), userInfo: nil, repeats: false)
    }
    
    func xuanzhuan() {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
        animation.duration = 0.5
        animation.values = [0, M_PI * 2]
        shapeLayer1.addAnimation(animation, forKey: nil)
        let animation1 = CAKeyframeAnimation(keyPath: "transform.scale")
        animation1.duration = 1
        animation1.values = [1, 0]
        animation1.removedOnCompletion = false
        animation1.fillMode = kCAFillModeForwards
        shapeLayer.addAnimation(animation1, forKey: nil)
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(rectAngle), userInfo: nil, repeats: false)
    }
    
    func rectAngle() {
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.frame = CGRect(x: screenWidth/2 - 60, y: screenHeight/2 - 90, width: 120, height: 120)
        view.layer.addSublayer(shapeLayer2)
        let path21 = UIBezierPath(rect:  CGRect(x: 0, y: 0, width: 120, height: 120))
        shapeLayer2.transform = CATransform3DMakeRotation(CGFloat(-M_PI), 0, 0, 1)
        shapeLayer2.path = path21.CGPath
        shapeLayer2.strokeStart = 0
        shapeLayer2.lineWidth = 5
        shapeLayer2.strokeColor = UIColor.cyanColor().CGColor
        shapeLayer2.fillColor = UIColor.clearColor().CGColor
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        shapeLayer2.addAnimation(animation, forKey: nil)
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(waves), userInfo: nil, repeats: false)
    }
    
    func waves() {
        let shapeLayer3 = CAShapeLayer()
        shapeLayer3.frame = CGRect(x: screenWidth/2 - 60, y: screenHeight/2 - 90, width: 120, height: 120)
        shapeLayer3.fillColor = UIColor.cyanColor().CGColor
        view.layer.addSublayer(shapeLayer3)
        let path31 = UIBezierPath()
        path31.moveToPoint(CGPoint(x: 0, y: 100))
        path31.addCurveToPoint(CGPoint(x: 120, y: 100), controlPoint1: CGPoint(x: 40, y: 80), controlPoint2: CGPoint(x: 80, y: 120))
        path31.addLineToPoint(CGPoint(x: 120, y: 120))
        path31.addLineToPoint(CGPoint(x: 0, y: 120))
        path31.closePath()
        let path32 = UIBezierPath()
        path32.moveToPoint(CGPoint(x: 0, y: 80))
        path32.addCurveToPoint(CGPoint(x: 120, y: 80), controlPoint1: CGPoint(x: 40, y: 100), controlPoint2: CGPoint(x: 80, y: 60))
        path32.addLineToPoint(CGPoint(x: 120, y: 120))
        path32.addLineToPoint(CGPoint(x: 0, y: 120))
        path32.closePath()
        let path33 = UIBezierPath()
        path33.moveToPoint(CGPoint(x: 0, y: 60))
        path33.addCurveToPoint(CGPoint(x: 120, y: 60), controlPoint1: CGPoint(x: 40, y: 40), controlPoint2: CGPoint(x: 80, y: 80))
        path33.addLineToPoint(CGPoint(x: 120, y: 120))
        path33.addLineToPoint(CGPoint(x: 0, y: 120))
        path33.closePath()
        let path34 = UIBezierPath()
        path34.moveToPoint(CGPoint(x: 0, y: 40))
        path34.addCurveToPoint(CGPoint(x: 120, y: 40), controlPoint1: CGPoint(x: 40, y: 60), controlPoint2: CGPoint(x: 80, y: 20))
        path34.addLineToPoint(CGPoint(x: 120, y: 120))
        path34.addLineToPoint(CGPoint(x: 0, y: 120))
        path34.closePath()
        let path35 = UIBezierPath()
        path35.moveToPoint(CGPoint(x: 0, y: 20))
        path35.addCurveToPoint(CGPoint(x: 120, y: 20), controlPoint1: CGPoint(x: 40, y: 0), controlPoint2: CGPoint(x: 80, y: 40))
        path35.addLineToPoint(CGPoint(x: 120, y: 120))
        path35.addLineToPoint(CGPoint(x: 0, y: 120))
        path35.closePath()
        let path36 = UIBezierPath()
        path36.moveToPoint(CGPoint(x: 0, y: 0))
        path36.addCurveToPoint(CGPoint(x: 120, y: 0), controlPoint1: CGPoint(x: 40, y: 0), controlPoint2: CGPoint(x: 80, y: 0))
        path36.addLineToPoint(CGPoint(x: 120, y: 120))
        path36.addLineToPoint(CGPoint(x: 0, y: 120))
        path36.closePath()
        let animation1 = CAKeyframeAnimation(keyPath: "path")
        animation1.values = [path31.CGPath, path32.CGPath, path33.CGPath, path34.CGPath, path35.CGPath, path36.CGPath];
        animation1.duration = 0.5
        animation1.removedOnCompletion = false
        animation1.fillMode = kCAFillModeForwards
        shapeLayer3.addAnimation(animation1, forKey: nil)
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(fullScreen), userInfo: nil, repeats: false)
    }
    func fullScreen() {
        let someView = UIView()
        someView.frame = CGRect(x: screenWidth/2 - 60, y: screenHeight/2 - 90, width: 120, height: 120)
        view.addSubview(someView)
        someView.backgroundColor = UIColor.cyanColor()
        UIView.animateWithDuration(0.25) { 
            someView.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

