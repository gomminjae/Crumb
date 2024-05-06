//
//  CrumbTests.swift
//  CrumbTests
//
//  Created by 권민재 on 5/6/24.
//

import XCTest
import Crumb_Tests
import Crumb
import UIKit

class CrumbTests: XCTestCase {
    var crumbView: CrumbView!
        
        override func setUp() {
            super.setUp()
            crumbView = CrumbView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        }
        
        override func tearDown() {
            crumbView = nil
            super.tearDown()
        }
        
        func testParticleImageSetCorrectly() {
            let testImage = UIImage(named: "shiba")
            crumbView.particleImage = testImage
            XCTAssertEqual(crumbView.particleImage, testImage)
        }
        
        func testEnableGestures() {
            crumbView.enableGestures = [.pin, .tap]
            XCTAssertTrue(crumbView.gestureRecognizers?.contains(where: { $0 is UIPanGestureRecognizer }) ?? false)
            XCTAssertTrue(crumbView.gestureRecognizers?.contains(where: { $0 is UITapGestureRecognizer }) ?? false)
        }
        
//        func testHandlePin() {
//            crumbView.enableGestures = [.pin]
//            
//            let gestureRecognizer = crumbView.panGestureRecognizer
//            crumbView.handlePin(sender: gestureRecognizer)
//        }
//        
//        func testHandleTap() {
//            crumbView.enableGestures = [.tap]
//            
//            let gestureRecognizer = crumbView.tapGestureRecognizer
//            crumbView.handleTap(sender: gestureRecognizer)
//        }
    
}
