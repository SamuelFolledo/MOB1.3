//
//  MOB1_3ClassWorkTests.swift
//  MOB1.3ClassWorkTests
//
//  Created by Macbook Pro 15 on 4/27/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import XCTest
@testable import MOB1_3ClassWork

class MOB1_3ClassWorkTests: XCTestCase {

    var ferrari: Car!
    var jeep: Car!
    var mazda: Car!
    
    override func setUp() {
        ferrari = Car(type: .Sport, transmissionMode: .Drive)
        jeep = Car(type: .OffRoad, transmissionMode: .Drive)
        mazda = Car(type: .Economy, transmissionMode: .Park)
    }
    
    override func tearDown() {
        ferrari = nil
        jeep = nil
        mazda = nil
    }
    
    //Day 9 unit tests
    func testCar() {
        ferrari.start(minutes: 60)
        jeep.start(minutes: 60)
        XCTAssert(ferrari.miles > jeep.miles)
    }
    
    func testVowelsInAString() {
        XCTAssertEqual(vowelsInAString(string: "Cake"), 2)
    }
    
    
}
