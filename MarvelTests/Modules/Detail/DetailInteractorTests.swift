//
//  DetailInteractorTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
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
        // GIVEN
        self.provider.isSuccess = true
        // WHEN
        self.interactor?.getCharacterDetail()
        // THEN
        XCTAssertTrue(self.provider.isCharacterListCalled)
        XCTAssertTrue(self.presenter.isSetCharacterCalled)
    }
    
    func test_getCharacterDetail_failure() {
        // GIVEN
        self.provider.isSuccess = false
        // WHEN
        self.interactor?.getCharacterDetail()
        // THEN
        XCTAssertTrue(self.provider.isCharacterListCalled)
        XCTAssertTrue(self.presenter.isSetCharacterDetailErrorCalled)
    }
}
