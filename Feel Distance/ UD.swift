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
    
    func add(key: String, value: AnyObject) {
        if ud.objectForKey(key) == nil {
            ud.setObject([], forKey: key)
        }
        var array = ud.objectForKey(key) as! [AnyObject]
        array += [value]
        ud.setObject(array, forKey: key)
    }
    
    func get(key: String) -> AnyObject {
        return ud.objectForKey(key)!
    }
}
