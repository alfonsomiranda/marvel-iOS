//
//  DetailPresenterTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import XCTest
@testable import Marvel

class DetailPresenterTests: XCTestCase {
    var presenter: DetailPresenter?
    var interactor = DetailInteractorMock()

    override func setUp() {
        self.presenter = DetailPresenter()
        self.presenter?.baseInteractor = interactor
    }

    override func tearDown() {
        self.presenter = nil
    }

    func test_view_did_load() {
        // WHEN
        self.presenter?.viewDidLoad()
        // THEN
        XCTAssertTrue(self.interactor.isGetCharacterDetailIsCalled)
    }

}
