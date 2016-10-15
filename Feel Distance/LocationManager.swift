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
    
    override init() {
        super.init()
        
        self.lm = CLLocationManager()
        self.lm.delegate = self
        
        //これが最後の罠。ここに書く。
        // 「アプリ使用時のみ許可」でなかったら、ダイアログを出す。
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse {
            self.lm.requestWhenInUseAuthorization()
        }
        self.lm.desiredAccuracy = kCLLocationAccuracyBest
        self.lm.distanceFilter = kCLDistanceFilterNone
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
        /* TODO: データが抜けたときも対処する let speeds: [speed?]
         if speed != nil {
         self.graphView.values += [speed]
         }
         */
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
    }
}