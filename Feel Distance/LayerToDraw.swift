//
//  LayerToDraw.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/19.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit

class LayerToDraw: CAShapeLayer {
    var width : CGFloat
    var height: CGFloat
    
    override init() {
        width  = UD.get("DataPlottedViewBoundsSizeWidth" ) as! CGFloat
        height = UD.get("DataPlottedViewBoundsSizeHeight") as! CGFloat
        super.init()
    }
    
    override init(layer: AnyObject) {
        width  = UD.get("DataPlottedViewBoundsSizeWidth" ) as! CGFloat
        height = UD.get("DataPlottedViewBoundsSizeHeight") as! CGFloat
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func point(x: Float, y: Float) -> CGPoint{
        return CGPointMake(width  - CGFloat(x) * 1.0,
                           height - CGFloat(y) * 5.0)
    }
}