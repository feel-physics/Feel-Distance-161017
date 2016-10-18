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
    
    
    /*
    NSUnknownKeyExceptionが出た時の回避方法 | iPhoneアプリ開発者の憂鬱 
    http://ios.steppers-hi.net/?eid=24
    */
    
    required init?(coder aDecoder: NSCoder) {
        model = KvoModel.sharedInstance
        //shape = nil
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(animated: Bool) {
        model.addObserver(self, forKeyPath: "value", options: .New, context: nil)
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "value" {
            shapeLayers += [CAShapeLayer()]
            let shapeLayer = shapeLayers.last!
            // 円のCALayer作成
            shapeLayer.strokeColor = UIColor.blueColor().CGColor  // 輪郭は青色
            shapeLayer.fillColor = UIColor.whiteColor().CGColor  // 図形の中の色は白色
            shapeLayer.lineWidth = 3.0  // 輪郭の線の太さは1.0pt
            shapeLayer.lineDashPattern = [2, 3]
            
            
            let graphPath = UIBezierPath()
            func point(x: CGFloat, y: CGFloat) -> CGPoint {
                return CGPointMake(view.bounds.size.width - x, view.bounds.size.height - y)
            }
            graphPath.moveToPoint(point(0.0, y: 0.0))
            graphPath.addLineToPoint(point(10.0, y: 0.0))
            graphPath.addLineToPoint(point(10.0, y: CGFloat(model.value)))
            graphPath.addLineToPoint(point(0.0, y: CGFloat(model.value)))
            graphPath.closePath()
            shapeLayer.path = graphPath.CGPath
            
            // 作成したCALayerを画面に追加
            view.layer.addSublayer(shapeLayer)
            
            for shapeLayer in shapeLayers {
                shapeLayer.position.x -= 10.0
            }
//            shape = getColumn(model.value)
//            print(model.value)
            //shape!.position.x += 10.0
            //shape?.position.y = CGFloat(model.valueSum)
            //print(shape!.position.x)
//            view.layer.mask = shape
//            view.layer.addSublayer(shape!)
//            view.setNeedsDisplay()
//            view.layer.setNeedsDisplay()
        }
    }
    
    // 打点メソッド
    func point(valueX:Float, valueY:Float) -> CGPoint {
        //print(view.frame.width, view.frame.height)
        return CGPointMake(view.frame.width  - CGFloat(valueX * 5.0),
                           view.frame.height - CGFloat(valueY * 5.0))
    }
    
    func getColumn(height: Float) -> DataPlottedShapeLayer {
        var points: [CGPoint] = []
        points += [point(10.0, valueY: height)]
        points += [point(0.0 , valueY: height)]
        points += [point(0.0 , valueY:  0.0)]
        points += [point(10.0, valueY:  0.0)]
        return DataPlottedShapeLayer(points: points)
    }
}