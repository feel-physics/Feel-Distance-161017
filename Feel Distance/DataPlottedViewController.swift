//
//  DataPlottedViewController.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit

class DataPlottedViewController: UIViewController{
    var valuesToDraw: [Float] = []
    @IBOutlet var dataPlottedView: DataPlottedView!
    
    func addValue(value: Float!) -> Void {
        dataPlottedView.addValue(value)
    }
}