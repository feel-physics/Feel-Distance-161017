//
//  GraphViewController.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {
    let model: KvoModel
    
    required init?(coder aDecoder: NSCoder) {
        model = KvoModel.sharedInstance
        super.init(coder: aDecoder)
        model.addObserver(self, forKeyPath: "value", options: .New, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "value" {
            print(model.value)
        }
    }
}