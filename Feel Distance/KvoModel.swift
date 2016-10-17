//
//  KvoModel.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/18.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import Foundation

class KvoModel: NSObject {
    
    class var sharedInstance: KvoModel {
        struct Singleton {
            static let instance: KvoModel = KvoModel()
        }
        return Singleton.instance
    }
    
    dynamic var value    = Float(0.0)
    dynamic var valueSum = Float(0.0)
    
    func addValue( value: Float) {
        self.value = value
        valueSum += value
    }
}