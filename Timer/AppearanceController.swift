//
//  AppearanceController.swift
//  Timer
//
//  Created by admin on 2/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class AppearanceController {
    
    static func initializeAppearanceDefaults() {
        UINavigationBar.appearance().barTintColor = UIColor.spaceGray()
        UITabBar.appearance().barTintColor = UIColor.babyBlue()
        UISegmentedControl.appearance().tintColor = UIColor.cougarBlue()
        UIButton.appearance().tintColor = UIColor.blackNight()
        
        
    }
}

