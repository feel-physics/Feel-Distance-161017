//
//   UD.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import Foundation

class UD: NSObject {
    var ud: NSUserDefaults
    
    override init() {
        ud = NSUserDefaults.standardUserDefaults()
        super.init()
    }
    
    func set(key: String, value: AnyObject) {
        ud = NSUserDefaults.standardUserDefaults()
        ud.registerDefaults([key: value])
    }
    
    func reset() {
        let bundle = NSBundle.mainBundle().bundleIdentifier
        ud.removePersistentDomainForName(bundle!)
    }
}
