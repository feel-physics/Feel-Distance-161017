//
//  DataPlottedView.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit

class DataPlottedView: UIView{
    var valuesToDraw: [Float]
    
    required init?(coder aDecoder: NSCoder) {
        valuesToDraw = []
        super.init(coder: aDecoder)
        backgroundColor = UIColor(white: 0, alpha: 0.0)
    }
    
    override func drawRect(rect: CGRect) {
        if 2 <= valuesToDraw.count {
            let graph = UIBezierPath()
            graph.moveToPoint(point(Float(valuesToDraw.count - 1), valueY: valuesToDraw[0]))
            for x in 1..<valuesToDraw.count {
                // 左上の点から右上の点へポリラインを引いていく
                graph.addLineToPoint(point(Float(valuesToDraw.count - 1 - x), valueY: valuesToDraw[x]))
            }
            graph.closePath()
            Color.graph.setStroke()
            graph.lineWidth = 2
            graph.stroke()
            graph.fill()
        }
    }
    
    // 打点メソッド
    func point(valueX:Float, valueY:Float) -> CGPoint {
        return CGPointMake(self.frame.width  - CGFloat(valueX * 5.0),
                           self.frame.height - CGFloat(valueY * 5.0))
    }
}