//
//  GraphViewController.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {
    var values: [Float] = []
    var dataPlottedViewController: DataPlottedViewController?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dataPlottedViewController = nil
    }
    
    //セグエ先のViewControllerのプロパティを取得する方法
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "dataPlotted" {
            dataPlottedViewController = segue.destinationViewController as? DataPlottedViewController
        }
    }

    func addValue(value: Float!) -> Void {
        values += [value]
        dataPlottedViewController!.addValue(value)
    }
}