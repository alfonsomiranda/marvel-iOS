//
//  ListInteractorTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 28/02/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import XCTest
@testable import Marvel

class ListInteractorTests: XCTestCase {
    
    var interactor: ListInteractor?
    var provider = CharacterProviderMock()
    var presenter = ListPresenterMock()

    override func setUp() {
        //GIVEN
        self.interactor = ListInteractor()
        self.interactor?.provider = self.provider
        self.interactor?.basePresenter = self.presenter
    }

    override func tearDown() {
        self.interactor = nil
    }

    func test_getCharacters_is_success() {
        //WHEN
        self.provider.isSuccess = true
        self.interactor?.getCharacters(limit: 20, offset: 0)
        //THEN
        XCTAssert(self.provider.isCharacterListCalled)
        XCTAssert(self.presenter.isSetCharactersCalled)
    }
    
    func test_getCharacters_is_failed() {
        //WHEN
        provider.isSuccess = false
        self.interactor?.getCharacters(limit: 20, offset: 0)
        //THEN
        XCTAssert(self.provider.isCharacterListCalled)
        XCTAssert(self.presenter.isShowErrorCharactersCalled)
    }

}
