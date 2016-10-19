//
//  DataPlottedShapeLayer.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit
import Foundation

class DataPlottedShapeLayer: LayerToDraw {
    
    init(value: Float, previousValue: Float,
         parentViewController: DataPlottedViewController)
    {
        super.init()
        //shapeLayer.strokeColor = Color.graph.CGColor  // 輪郭の色
        fillColor   = Color.graph.CGColor  // 図形の中の色
        lineWidth   = 3.0  // 輪郭の線の太さは1.0pt
        
        let graphPath = UIBezierPath()
        let value = Float(value)
        graphPath.moveToPoint   (point(-10.0, y: 0.0))            // 原点
        graphPath.addLineToPoint(point(  0.0, y: 0.0))            // x軸上の点
        graphPath.addLineToPoint(point(  0.0, y: previousValue))  // 現在地
        graphPath.addLineToPoint(point(-10.0, y: value))          // y軸上の点
        graphPath.closePath()
        path = graphPath.CGPath
    }
    
    override init(layer: AnyObject) {
        super.init(layer: layer)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}