//
//  DataPlottedView.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit

class DataPlottedView: UIView{

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor(white: 0, alpha: 1.0)
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