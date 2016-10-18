//
//  DataPlottedViewController.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit

class DataPlottedViewController: UIViewController{
    let shape = DataPlottedShapeLayer()
    let model: KvoModel

    required init?(coder aDecoder: NSCoder) {
        model = KvoModel.sharedInstance
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(animated: Bool) {
        model.addObserver(self, forKeyPath: "valueSum", options: .New, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "valueSum" {
            print(model.valueSum)
            shape.position.x += 10.0
            view.layer.mask = shape
            view.setNeedsDisplay()
        }
    }
}