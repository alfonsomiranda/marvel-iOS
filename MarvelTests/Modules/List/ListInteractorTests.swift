//
//  ListInteractorTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import XCTest
@testable import Marvel

class ListInteractorTests: XCTestCase {
    
    var interactor: ListInteractor?
    var provider = CharacterProviderMock()
    var presenter = ListPresenterMock()

    override func setUp() {
        // GIVEN
        self.interactor = ListInteractor()
        self.interactor?.provider = self.provider
        self.interactor?.basePresenter = self.presenter
    }

    override func tearDown() {
        self.interactor = nil
    }

    func test_getCharacters_is_success() {
        // WHEN
        self.provider.isSuccess = true
        self.interactor?.getCharacters(limit: 20, offset: 0)
        // THEN
        XCTAssertTrue(self.provider.isCharacterListCalled)
        XCTAssertTrue(self.presenter.isSetCharactersCalled)
    }
    
    func test_getCharacters_is_failed() {
        // WHEN
        provider.isSuccess = false
        self.interactor?.getCharacters(limit: 20, offset: 0)
        // THEN
        XCTAssertTrue(self.provider.isCharacterListCalled)
        XCTAssertTrue(self.presenter.isShowErrorCharactersCalled)
    }

}
