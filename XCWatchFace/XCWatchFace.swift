//
//  XCWatchFace.swift
//  xkcd Clock
//
//  Created by Alexander v. Below on 06.03.15.
//  Copyright (c) 2015 Alexander von Below. All rights reserved.
//

import Foundation

@objc public class XCWatchFace : NSObject {
    var size : CGSize
    public init (size : CGSize) {
        self.size = size
    }
    
    public func image (secondsFromGMT secondsFromGMT : Int = NSTimeZone.localTimeZone().secondsFromGMT, date : NSDate = NSDate() ) -> UIImage? {
        if let innerClockImage = UIImage(named: "InnerClock") {
            if let outerClockImage = UIImage(named: "OuterClock") {
                
                let innerOriginalSize = innerClockImage.size
                let outerOriginalSize = outerClockImage.size;
                var outerDest = CGRectZero
                outerDest.size = self.size
                outerDest.origin = CGPointMake(-floor(outerDest.size.width/2), -floor(outerDest.size.height/2))
                var innerDest = CGRectZero
                
                innerDest.size.width = innerOriginalSize.width / outerOriginalSize.width * outerDest.width
                innerDest.size.height = innerOriginalSize.height / outerOriginalSize.height * outerDest.height;
                let dx = -floor(innerDest.size.width / 2)
                let dy = -floor(innerDest.size.height / 2)
                innerDest.origin = CGPointMake(dx, dy)
                
                UIGraphicsBeginImageContext( self.size )
                let ctx = UIGraphicsGetCurrentContext()
                CGContextTranslateCTM(ctx, floor(self.size.width/2), floor(self.size.height/2))
              
                if let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian) {
                    let components = gregorian.components([NSCalendarUnit.Second,  NSCalendarUnit.Minute,  NSCalendarUnit.Hour], fromDate: date)
                    let totalSeconds = components.second + (components.hour * 60 + components.minute) * 60;
                    let noon = CGFloat(12 * 60 * 60)
                    let adjustedTime = CGFloat(totalSeconds) - noon;
                    let outerDegrees = CGFloat(adjustedTime) * 180.0 / noon;
                    
                    // Move the origin to the middle of the image so we will rotate and scale around the center.
                    CGContextSaveGState(ctx)
                    
                    CGContextRotateCTM(ctx, (outerDegrees * CGFloat(M_PI)) / 180.0)
                    
                    outerClockImage.drawInRect(outerDest)
                    CGContextRestoreGState(ctx)
                }
                let mapOffset = 2*60*60
                let rotateInterval = mapOffset - secondsFromGMT
                let innerDegrees = CGFloat(rotateInterval) / (60.0 * 60.0) * 360.0 / 24.0
                
                                CGContextRotateCTM(ctx, (innerDegrees * CGFloat(M_PI)) / 180.0)
                
                innerClockImage.drawInRect(innerDest)
                let finalImage = UIGraphicsGetImageFromCurrentImageContext()
                
                UIGraphicsEndImageContext();
                return finalImage
            }
        }
        return nil;
        //        return UIImage(CIImage: CIImage.emptyImage())!
    }
}