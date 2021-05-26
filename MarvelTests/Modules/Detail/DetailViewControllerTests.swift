//
//  DetailViewControllerTests.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 01/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
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
        //WHEN
        self.view?.viewDidLoad()
        //THEN
        XCTAssert(self.presenter.isViewDidLoadCalled)
    }
}
