//
//  Alarm.swift
//  Timer
//
//  Created by admin on 2/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class Alarm: NSObject {
    
    static let categoryAlarm = "categoryAlarm"
    static let notificationComplete = "notificationComplete"
    
    private(set) var alarmDate: NSDate?
    private(set) var alarmTime: NSTimeInterval
    
    
    private var localNotification: UILocalNotification?
    var isArmed: Bool{
        get{
            if alarmDate != nil {
                return true
            }else {
                return false
            }
        }
    }
    
    func arm(fireDate: NSDate) {
        alarmDate = fireDate
        let alarmNotification = UILocalNotification()
        alarmNotification.fireDate = fireDate
        alarmNotification.timeZone = NSTimeZone.localTimeZone()
        alarmNotification.soundName = "sms-received3.caf"
        alarmNotification.alertBody = "Alarm Complete!"
        alarmNotification.category = Alarm.categoryAlarm
        
        UIApplication.sharedApplication().scheduleLocalNotification(alarmNotification)
        localNotification = alarmNotification
        
    }
    
    func cancel() {
        if isArmed {
            alarmDate = nil
            if let localNotification = localNotification {
                UIApplication.sharedApplication().cancelLocalNotification(localNotification)
            }
        }
    }
    static func alarmComplete() {
        NSNotificationCenter.defaultCenter().postNotificationName(Alarm.notificationComplete, object: nil)
    
    }
}
