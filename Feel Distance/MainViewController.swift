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
    var locationManager: LocationManager!
    var graphViewController: GraphViewController!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        locationManager = LocationManager()
    }
    
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