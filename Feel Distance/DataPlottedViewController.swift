//
//  DataPlottedViewController.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit

class DataPlottedViewController: UIViewController{
    let model: KvoModel
    var shape: DataPlottedShapeLayer?
    
    /*
    NSUnknownKeyExceptionが出た時の回避方法 | iPhoneアプリ開発者の憂鬱 
    http://ios.steppers-hi.net/?eid=24
    */
    
    required init?(coder aDecoder: NSCoder) {
        model = KvoModel.sharedInstance
        shape = nil
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(animated: Bool) {
        model.addObserver(self, forKeyPath: "value", options: .New, context: nil)
    }
    
    override func viewDidLayoutSubviews() {
//        view.layer.anchorPoint = CGPointMake(0.0, 1.0)
//        var points: [CGPoint] = []
//        points += [point(10.0, valueY: 20.0)]
//        points += [point(0.0 , valueY: 30.0)]
//        points += [point(0.0 , valueY:  0.0)]
//        points += [point(10.0, valueY:  0.0)]
//        shape = DataPlottedShapeLayer(points: points)
//        shape?.setAnchorPoint(CGPointMake(1.0, 1.0), forView: view)
//        view.layer.setAnchorPoint(CGPointMake(1.0, 1.0), forView: view)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "value" {
            addColumn(model.value)
            print(model.value)
            //shape!.position.x += 10.0
            //shape?.position.y = CGFloat(model.valueSum)
            //print(shape!.position.x)
            view.layer.mask = shape
            view.setNeedsDisplay()
        }
    }
    
    // 打点メソッド
    func point(valueX:Float, valueY:Float) -> CGPoint {
        print(view.frame.width, view.frame.height)
        return CGPointMake(view.frame.width  - CGFloat(valueX * 5.0),
                           view.frame.height - CGFloat(valueY * 5.0))
    }
    
    func addColumn(height: Float) {
        var points: [CGPoint] = []
        points += [point(10.0, valueY: height)]
        points += [point(0.0 , valueY: height)]
        points += [point(0.0 , valueY:  0.0)]
        points += [point(10.0, valueY:  0.0)]
        shape = DataPlottedShapeLayer(points: points)
    }
}