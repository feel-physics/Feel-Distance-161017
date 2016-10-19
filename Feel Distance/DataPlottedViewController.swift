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
    var shapeLayers: [CAShapeLayer] = []
    var lastValue: Float = 0.0
    var dataPlottedShapeLayers: [DataPlottedShapeLayer] = []
    
    /*
    NSUnknownKeyExceptionが出た時の回避方法 | iPhoneアプリ開発者の憂鬱 
    http://ios.steppers-hi.net/?eid=24
    */
    
    required init?(coder aDecoder: NSCoder) {
        model = KvoModel.sharedInstance
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(animated: Bool) {
        model.addObserver(self, forKeyPath: "value", options: .New, context: nil)
    }
    
    override func observeValueForKeyPath(
        keyPath: String?,
        ofObject object: AnyObject?,
                 change: [String : AnyObject]?,
                 context: UnsafeMutablePointer<Void>)
    {
        if keyPath == "value" {
            let newValue = Float(model.value)
            let newDataPlottedShapeLayer = DataPlottedShapeLayer(
                value: newValue, previousValue: lastValue,
                parentViewController: self)
            dataPlottedShapeLayers.append(newDataPlottedShapeLayer)
            // 作成したCALayerを画面に追加
            view.layer.addSublayer(newDataPlottedShapeLayer)
            
            for dataPlottedShapeLayer in dataPlottedShapeLayers {
                dataPlottedShapeLayer.position.x -= 10.0
            }
            
            lastValue = newValue
        }
    }
}