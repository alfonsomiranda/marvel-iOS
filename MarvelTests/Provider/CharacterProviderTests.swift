//
//  CharacterProviderTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterProviderTests: XCTestCase {
    var provider: CharacterProvider?
    var requestManager = RequestManagerMock()

    override func setUp() {
        self.provider = CharacterProvider()
        self.provider?.manager = requestManager
    }

    override func tearDown() {
        self.provider = nil
    }

    func test_request_is_success() {
        let providerDTO = ProviderDTO(arrayParams: nil, method: .get, endpoint: "", urlContext: .backend)
        let expect = self.expectation(description: #function)
        self.requestManager.isSuccess = true
        _ = self.provider?.request(dto: providerDTO, success: { (data) in
            XCTAssert(data != nil)
            
            expect.fulfill()
        }, failure: { (_) in
            expect.fulfill()
        })
        
        waitForExpectations(timeout: 10.0) { error in
            XCTAssertNil(error)
            XCTAssertTrue(self.requestManager.isRequestSuccessCalled)
            XCTAssertFalse(self.requestManager.isRequestFailureCalled)
        }
    }
    
    func test_request_is_failure() {
        let providerDTO = ProviderDTO(arrayParams: nil, method: .get, endpoint: "", urlContext: .backend)
        let expect = self.expectation(description: #function)
        self.requestManager.isSuccess = false
        _ = self.provider?.request(dto: providerDTO, success: { (data) in
            XCTAssert(data != nil)
            
            expect.fulfill()
        }, failure: { (_) in
            expect.fulfill()
        })
        
        waitForExpectations(timeout: 10.0) { error in
            XCTAssertNil(error)
            XCTAssertFalse(self.requestManager.isRequestSuccessCalled)
            XCTAssertTrue(self.requestManager.isRequestFailureCalled)
        }
    }
}
