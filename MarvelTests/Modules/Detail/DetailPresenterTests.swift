//
//  DetailPresenterTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 01/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
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
        //WHEN
        self.presenter?.viewDidLoad()
        //THEN
        XCTAssert(self.interactor.isGetCharacterDetailIsCalled)
    }

}
