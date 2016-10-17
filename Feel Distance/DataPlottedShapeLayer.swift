//
//  DataPlottedShapeLayer.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit

class DataPlottedShapeLayer: CAShapeLayer {
    
    override init() {
        super.init()
        lineWidth = 2
        strokeColor = Color.graph.CGColor
        fillColor = Color.graph.CGColor
        path = CGPathCreateWithRect(CGRectMake(100, 100, 100, 100), nil)
    }
    
    override init(layer: AnyObject) {
        super.init(layer: layer)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /*
    func addValue(value: Float!) -> Void {
        values += [value]
        let graph = UIBezierPath()
        graph.moveToPoint(point(Float(values.count - 1), valueY: values.first!))
        for x in 1..<values.count {
            // 左上の点から右上の点へポリラインを引いていく
            graph.addLineToPoint(point(Float(values.count - 1 - x), valueY: values[x]))
        }
        graph.closePath()
        Color.graph.setStroke()
        graph.lineWidth = 2
        graph.stroke()
        graph.fill()

    }
    */
    
    // 打点メソッド
    func point(valueX:Float, valueY:Float) -> CGPoint {
        return CGPointMake(self.frame.width  - CGFloat(valueX * 5.0),
                           self.frame.height - CGFloat(valueY * 5.0))
    }
}