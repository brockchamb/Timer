//
//  AlarmViewController.swift
//  Timer
//
//  Created by admin on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {

    @IBOutlet weak var alarmDatePicker: UIDatePicker!
    @IBOutlet weak var alarmStatus: UILabel!
    @IBOutlet weak var alarmDateLabel: UILabel!
    @IBOutlet weak var alarmButtonTapped: UIButton!
    
    let alarm = Alarm()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmDatePicker.minimumDate = NSDate()
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "notificationComplete", name: Alarm.notificationComplete, object: nil)

        // Do any additional setup after loading the view.
        
        guard let scheduleNotifications = UIApplication.sharedApplication().scheduledLocalNotifications else { return }
        alarm.cancel()
        
        for notification in scheduleNotifications {
            if notification.category == Alarm.categoryAlarm {
                UIApplication.sharedApplication().cancelLocalNotification(notification)
                
                guard let fireDate = notification.fireDate else { return }
                alarm.arm(fireDate)
                alarmSet()
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
        
        func alarmSet() {
            let dateFormatter = NSDateFormatter()
            dateFormatter.timeStyle = .ShortStyle
            dateFormatter.dateStyle = .LongStyle
            
            alarmStatus.text = "Your alarm is set."
            
            if let date = alarm.alarmDate {
                alarmDateLabel.text = dateFormatter.stringFromDate(date)
                alarmDatePicker.date = date
            } else {
                alarmDateLabel.text = ""
            }
            
            alarmButtonTapped.setTitle("Canel Alarm", forState: .Normal)
            alarmDatePicker.userInteractionEnabled = false
        }
        
        func alarmNotSet() {
            alarm.cancel()
            alarmStatus.text = "Your alarm not set"
            alarmDateLabel.text = ""
            alarmButtonTapped.setTitle("Set Alarm", forState: .Normal)
            alarmDatePicker.minimumDate = NSDate()
            alarmDatePicker.date = NSDate()
            alarmDatePicker.userInteractionEnabled = true
            
            
        }
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


