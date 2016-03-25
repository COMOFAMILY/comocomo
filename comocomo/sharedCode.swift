//
//  sharedCode.swift
//  comocomo
//
//  Created by 한상현 on 2016. 3. 25..
//  Copyright © 2016년 양윤영. All rights reserved.
//

import Foundation

extension NSDate
{
    func toString() -> String
    {
        
        return ""
    }
}

extension NSDate
{
    convenience
    init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.ZZZ'Z'"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "UTC")
        let d = dateStringFormatter.dateFromString(dateString)!
        self.init(timeInterval:0, sinceDate:d)
    }
}