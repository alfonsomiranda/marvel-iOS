//
//  ListPresenterTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import XCTest
@testable import Marvel

class ListPresenterTests: XCTestCase {
    var presenter: ListPresenter?
    var view = ListViewControllerMock()
    var interactor = ListInteractorMock()

    override func setUp() {
        self.presenter = ListPresenter()
        self.presenter?.baseView = view
        self.presenter?.baseInteractor = interactor
    }

    override func tearDown() {
        self.presenter = nil
    }
    
    func test_view_did_load() {
        // WHEN
        self.presenter?.viewDidLoad()
        // THEN
        XCTAssertTrue(self.view.isSetTitleCalled)
        XCTAssertEqual(self.view.title, "MARVEL")
        XCTAssertTrue(self.interactor.isGetCharactersCalled)
    }

    func test_loadCharacters_success() {
        // WHEN
        self.presenter?.loadCharacters()
        // THEN
        XCTAssertTrue(self.interactor.isGetCharactersCalled)
    }
}
