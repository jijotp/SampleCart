//
//  TestAPPTests.swift
//  TestAPPTests
//
//  Created by Arjun on 05/02/21.
//

import XCTest
@testable import TestAPP

class TestAPPTests: XCTestCase {

    func testHelloWorld(){
        var helloWorld: String?
        XCTAssertNil(helloWorld)
        helloWorld = "hello world"
        XCTAssertEqual(helloWorld, "hdddd")
    }
}
