//
//  CustomVisualEffect.swift
//  SpotMenu
//
//   Created by Jake Folsom on 03/13/17.
//  Copyright © 2017 JFC. All rights reserved.
//

import Foundation
import AppKit

class CustomVisualEffect: NSVisualEffectView {
    var trackingArea:NSTrackingArea!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        // set tracking area
        let opts: NSTrackingAreaOptions = ([NSTrackingAreaOptions.mouseEnteredAndExited, NSTrackingAreaOptions.activeAlways])
        trackingArea = NSTrackingArea(rect: bounds, options: opts, owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea)
        
        let fadeAnim = CABasicAnimation(keyPath: "opacity")
        fadeAnim.fromValue = 1.0
        fadeAnim.toValue = 0
        fadeAnim.duration = 0.1
        self.layer?.add(fadeAnim, forKey: "opacity")
        self.alphaValue = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        // set tracking area
        let opts: NSTrackingAreaOptions = ([NSTrackingAreaOptions.mouseEnteredAndExited, NSTrackingAreaOptions.activeAlways])
        trackingArea = NSTrackingArea(rect: bounds, options: opts, owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea)
        
        let fadeAnim = CABasicAnimation(keyPath: "opacity")
        fadeAnim.fromValue = 1.0
        fadeAnim.toValue = 0
        fadeAnim.duration = 0.1
        self.layer?.add(fadeAnim, forKey: "opacity")
        self.alphaValue = 0
    }
    
    deinit {
        self.removeTrackingArea(trackingArea)
    }
    
    // MARK: mouse events
    override func mouseEntered(with theEvent: NSEvent) {
        let fadeAnim = CABasicAnimation(keyPath: "opacity")
        fadeAnim.fromValue = 0.0
        fadeAnim.toValue = 1
        fadeAnim.duration = 0.1
        self.layer?.add(fadeAnim, forKey: "opacity")
        //self.alphaValue = 0
        self.alphaValue = 1
    }
    
    override func mouseExited(with theEvent: NSEvent) {
        let fadeAnim = CABasicAnimation(keyPath: "opacity")
        fadeAnim.fromValue = 1.0
        fadeAnim.toValue = 0
        fadeAnim.duration = 0.1
        self.layer?.add(fadeAnim, forKey: "opacity")
        self.alphaValue = 0
    }

}
