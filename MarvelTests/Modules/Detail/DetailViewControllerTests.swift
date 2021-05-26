//
//  DetailViewControllerTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import XCTest
@testable import Marvel

class DetailViewControllerTests: XCTestCase {
    var view: DetailViewController?
    var presenter = DetailPresenterMock()

    override func setUp() {
        self.view = DetailAssembly.detailView()
        self.view?.beginAppearanceTransition(true, animated: true)
        self.view?.basePresenter = presenter
    }

    override func tearDown() {
        self.view?.endAppearanceTransition()
        self.view = nil
    }

    func test_view_did_load() {
        // WHEN
        self.view?.viewDidLoad()
        // THEN
        XCTAssertTrue(self.presenter.isViewDidLoadCalled)
    }
}
