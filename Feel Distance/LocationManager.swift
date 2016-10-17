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
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        /*
         iOSでのGPSデバッグ http://techblog.qoncept.jp/?p=12
        [iOS] CLLocationManagerで移動速度を取得する - Qiita 
        http://qiita.com/koogawa/items/05e2623f98af34b69d4c
        */
 
        let speed = Float(newLocation.speed * 3.6)  // m/sec -> km/h
        //print("speed: " + String(speed) + " km/h")
        sender.addValue(speed)
    }
    
    // 電波をつかまえられなかったとき
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
    }
}