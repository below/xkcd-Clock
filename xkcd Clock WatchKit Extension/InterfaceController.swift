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
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let watchFace = XCWatchFace(size: CGSizeMake(400, 400));
        let image = watchFace.image()
        self.watchImage.setImage(image)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
