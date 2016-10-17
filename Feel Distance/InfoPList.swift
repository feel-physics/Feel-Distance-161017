//
//  infoDictionary.swift
//  Feel Distance
//
//  Created by Tatsuro Ueda on 2016/10/17.
//  Copyright © 2016年 Tatsuro Ueda. All rights reserved.
//

import Foundation

/*
【iOS】Info.plistから値を取得する方法 | AdMax Tech Blog 
 http://tech.admax.ninja/2014/09/29/method-of-obtaining-the-value-of-info-plist/
 */
/*
 Swiftでクラスメソッド - Qiita http://qiita.com/econa77/items/5f9f079953e331207886
 */

class InfoPList: NSObject {
    // アプリのBundleIdentifierを取得
    class func get(label: String!) -> AnyObject?{
        return NSBundle.mainBundle().objectForInfoDictionaryKey(label)
    }
}