//
//  XCWatchFaceTests.swift
//  XCWatchFaceTests
//
//  Created by Alexander v. Below on 06.03.15.
//  Copyright (c) 2015 Alexander von Below. All rights reserved.
//

import UIKit
import XCTest
import XCWatchFace

class XCWatchFaceTests: XCTestCase {
    var watchFace : XCWatchFace?
    override func setUp() {
        super.setUp()
        self.watchFace = XCWatchFace(size: CGSizeMake(300, 300))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let image = watchFace?.image()
        XCTAssertNotNil(image, "image must not be nil")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
