//
//  TwoFingersGestureAction.swift
//  vcoin
//
//  Created by Marcin Czachurski on 20.01.2018.
//  Copyright © 2018 Marcin Czachurski. All rights reserved.
//

import Foundation
import VCoinKit

class TwoFingersGestureAction {
    
    var settingsHandler = SettingsHandler()
    var settings:Settings!
    var player = Player()
    
    init() {
        self.settings = self.settingsHandler.getDefaultSettings()
    }
    
    @objc func gestureRecognizer(sender: TwoFingersGestureRecognizer) {
        if sender.state == .ended {
            
            if sender.fingersDirection == .moveDown && !self.settings.isDarkMode {
                self.settings?.isDarkMode = true
                self.settingsHandler.save(settings: self.settings)
                
                player.play(name: "switch-on")
                NotificationCenter.default.post(name: .darkModeEnabled, object: nil)
            }
            
            if sender.fingersDirection == .moveUp && self.settings.isDarkMode {
                self.settings?.isDarkMode = false
                self.settingsHandler.save(settings: self.settings)
                
                player.play(name: "switch-off")
                NotificationCenter.default.post(name: .darkModeDisabled, object: nil)
            }
        }
    }
    
}