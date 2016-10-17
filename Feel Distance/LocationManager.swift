//
//  LocationManager.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/15.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    var lm: CLLocationManager!
    var sender: MainViewController!
    
    init(sender: MainViewController) {
        super.init()
        
        lm = CLLocationManager()
        lm.delegate = self
        
        //これが最後の罠。ここに書く。
        // 「アプリ使用時のみ許可」でなかったら、ダイアログを出す。
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse {
            lm.requestWhenInUseAuthorization()
        }
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.distanceFilter = kCLDistanceFilterNone
        
        self.sender = sender
    }
    
    func start() {
        self.lm.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        /*
         iOSでのGPSデバッグ http://techblog.qoncept.jp/?p=12
         */
        
        let speed = Float(locations.last!.speed * 3.6)  // m/sec -> km/h
        //print("speed: " + String(speed) + " km/h")
        sender.addValue(speed)
    }
    
    // 電波をつかまえられなかったとき
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
    }
}