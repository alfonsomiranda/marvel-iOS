//
//  ListPresenterTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 01/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
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
        //WHEN
        self.presenter?.viewDidLoad()
        //THEN
        XCTAssert(self.view.isSetTitleCalled)
        XCTAssert(self.view.title == "MARVEL")
        XCTAssert(self.interactor.isGetCharactersCalled)
    }

    func test_loadCharacters_success() {
        //WHEN
        self.presenter?.loadCharacters()
        //THEN
        XCTAssert(self.interactor.isGetCharactersCalled)
    }
}
