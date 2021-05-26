//
//  DetailInteractorTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 01/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import XCTest
@testable import Marvel

class DetailInteractorTests: XCTestCase {
    var interactor: DetailInteractor?
    var provider = CharacterProviderMock()
    var presenter = DetailPresenterMock()

    override func setUp() {
        self.interactor = DetailInteractor()
        self.interactor?.provider = provider
        self.interactor?.basePresenter = presenter
    }

    override func tearDown() {
        self.interactor = nil
    }

    func test_getCharacterDetail_success() {
        //GIVEN
        self.provider.isSuccess = true
        //WHEN
        self.interactor?.getCharacterDetail()
        //THEN
        XCTAssert(self.provider.isCharacterListCalled)
        XCTAssert(self.presenter.isSetCharacterCalled)
    }
    
    func test_getCharacterDetail_failure() {
        //GIVEN
        self.provider.isSuccess = false
        //WHEN
        self.interactor?.getCharacterDetail()
        //THEN
        XCTAssert(self.provider.isCharacterListCalled)
        XCTAssert(self.presenter.isSetCharacterDetailErrorCalled)
    }
}
