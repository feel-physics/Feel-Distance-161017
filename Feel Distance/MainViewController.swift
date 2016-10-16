//
//  ViewController.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/15.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    //viewDidLoadの中で作るとviewDidLoadが完了したときに消えてしまう
    let locationManager = LocationManager()

    /*セグエ先のViewControllerのプロパティを取得する方法
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "preview" {
            let previewViewController = segue.destinationViewController as! PreviewViewController
            //PreviewViewControllerのプロパティをprintする
            print("MainViewController@prepareForSegue: ", previewViewController.view.frame)
        }
    }
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}