//
//  LogoutViewInteractorTests.swift
//  ExampleAppTests
//
//  Created by Gevorgyan, Artak on 29/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import XCTest

class LogoutViewInteractorTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testLogoutViewInteractor() {
        let interactor = LogoutViewInteractorImplementation()
        let exp = expectation(description: #function)
        interactor.performLogout(success: { (isSuccess) in
            print("Logout response")
            exp.fulfill()
            XCTAssert(isSuccess, "Response should be true")
        }) { (failure) in
            XCTFail()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }

}
