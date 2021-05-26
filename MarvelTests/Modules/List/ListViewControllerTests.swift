//
//  ListViewControllerTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
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
        // WHEN
        view?.viewDidLoad()
        // THEN
        XCTAssertTrue(self.presenter.isViewDidLoadCalled)
        XCTAssertEqual(self.view?.title, "MARVEL")
    }

    func test_reload_button_is_touched() {
        // WHEN
        self.view?.reloadButton.sendActions(for: .touchUpInside)
        // THEN
        XCTAssertTrue(self.presenter.isLoadCharactersCalled)
    }
}
