//
//  DataPlottedView.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit

class DataPlottedView: UIView{
    var values: [Float!]
//    let shape = CAShapeLayer()
    let shape = DataPlottedShapeLayer()

//    var dataPlottedShapeLayer: DataPlottedShapeLayer?
    
    required init?(coder aDecoder: NSCoder) {
        values = []
//        dataPlottedShapeLayer = DataPlottedShapeLayer(coder: aDecoder)!
        super.init(coder: aDecoder)
        backgroundColor = UIColor(white: 0, alpha: 1.0)

        /*
        shape.lineWidth = 2
        shape.strokeColor = Color.graph.CGColor
        shape.fillColor = Color.graph.CGColor
        layer.mask = shape
        shape.path = CGPathCreateWithRect(CGRectMake(100, 100, 100, 100), nil)
        */
    }
    
    func addValue(value: Float!) -> Void {
        values += [value]
        /*
        if 3 <= values.count {

            let path = UIBezierPath()
            path.moveToPoint(point(Float(values.count - 1), valueY: values.first!))
            for x in 1..<values.count {
                // 左上の点から右上の点へポリラインを引いていく
                path.addLineToPoint(point(Float(values.count - 1 - x), valueY: values[x]))
            }
            path.closePath()

            shape.path = path.CGPath
 
        }
        */
        shape.position.x += 10.0
        layer.mask = shape
        setNeedsDisplay()
    }
    
    // 打点メソッド
    func point(valueX:Float, valueY:Float) -> CGPoint {
        return CGPointMake(self.frame.width  - CGFloat(valueX * 5.0),
                           self.frame.height - CGFloat(valueY * 5.0))
    }

    /*
    func addValue(value: Float!) {
        valuesToDraw += [value]
        if 1 < valuesToDraw.count {
            dataPlottedShapeLayer.addValue(value)
            dataPlottedShapeLayer.position.x -= 5.0
            self.setNeedsDisplay()
        }
    }
    */
}