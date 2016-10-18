//
//   UD.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import Foundation

class UD: NSObject {
    static let ud = NSUserDefaults.standardUserDefaults()

    class func get(key: String!) -> AnyObject? {
        return ud.objectForKey(key)
    }
    
    class func set(key: String!, value: AnyObject!) {
        
        ud.setObject(value, forKey: key)
        ud.synchronize()
    }
    
    class func remove(key: String!) {
        ud.removeObjectForKey(key)
    }
    class func reset() {
        let bundle = NSBundle.mainBundle().bundleIdentifier
        ud.removePersistentDomainForName(bundle!)
    }
}