//
//  CharacterProviderTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 02/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
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
        self.requestManager.isSuccess = true
        _ = self.provider?.request(dto: providerDTO, success: { [weak self] (data) in
            XCTAssert(self?.requestManager.isRequestSuccessCalled ?? false)
            XCTAssert(data != nil)
        }, failure: { [weak self] (_) in
            XCTAssert(!(self?.requestManager.isRequestFailureCalled ?? false))
        })
    }
    
    func test_request_is_failure() {
        let providerDTO = ProviderDTO(arrayParams: nil, method: .get, endpoint: "", urlContext: .backend)
        self.requestManager.isSuccess = false
        _ = self.provider?.request(dto: providerDTO, success: { [weak self] (data) in
            XCTAssert(!(self?.requestManager.isRequestSuccessCalled ?? false))
            XCTAssert(data != nil)
        }, failure: { [weak self] (_) in
            XCTAssert(self?.requestManager.isRequestFailureCalled ?? false)
        })
    }
}
