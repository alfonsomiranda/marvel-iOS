//
//  ListViewControllerTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 01/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import XCTest
@testable import Marvel

class ListViewControllerTests: XCTestCase {
    var view: ListViewController?
    var presenter = ListPresenterMock()

    override func setUp() {
        view = ListAssembly.listView()
        view?.beginAppearanceTransition(true, animated: false)
        view?.basePresenter = presenter
    }

    override func tearDown() {
        view?.endAppearanceTransition()
        view = nil
    }
    
    func test_viewDidLoad_is_called() {
        //WHEN
        view?.viewDidLoad()
        //THEN
        XCTAssert(self.presenter.isViewDidLoadCalled)
        XCTAssert(self.view?.title == "MARVEL")
    }

    func test_reload_button_is_touched() {
        //WHEN
        self.view?.reloadButton.sendActions(for: .touchUpInside)
        //THEN
        XCTAssert(self.presenter.isLoadCharactersCalled)
    }
}
