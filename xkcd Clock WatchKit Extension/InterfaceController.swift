//
//  InterfaceController.swift
//  xkcd Clock WatchKit Extension
//
//  Created by Alexander v. Below on 04.03.15.
//  Copyright (c) 2015 Alexander von Below. All rights reserved.
//

import WatchKit
import Foundation
import XCWatchFace

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var watchImage: WKInterfaceImage!
    
    var timer : NSTimer?
    var watchFace : XCWatchFace?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var contentFrame = self.contentFrame;
        let imageSize = WKInterfaceDevice.currentDevice().screenScale * min(contentFrame.size.width, contentFrame.size.height)
        self.watchFace = XCWatchFace(size: CGSizeMake(imageSize, imageSize));
    }

    override func willActivate() {
        super.willActivate()
        self.updateClock()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(2*60, target: self, selector: "updateClock", userInfo: nil, repeats: true)
    }

    override func didDeactivate() {
        self.timer?.invalidate()
        self.timer = nil
        super.didDeactivate()
    }

    func updateClock() {
        let image = self.watchFace?.image()
        self.watchImage.setImage(image)
    }
}
