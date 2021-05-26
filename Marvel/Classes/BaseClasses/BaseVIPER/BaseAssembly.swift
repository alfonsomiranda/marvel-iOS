//
//  BaseAssembly.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit
// swiftlint:disable large_tuple

// Base class, it is declared as a good practice to implement new functions in a global way in the application.
class BaseAssembly {
    
    static func assembly<View: BaseViewController,
        Presenter: BasePresenter,
        Router: BaseRouter,
        Interactor: BaseInteractor>(baseView: View,
                                    presenter: Presenter.Type,
                                    router: Router.Type,
                                    interactor: Interactor.Type)
        -> (view: View, presenter: Presenter, interactor: Interactor, router: Router) {

        let basePresenter = Presenter()
        let baseRouter = Router()
        let baseInteractor = Interactor()

        baseView.basePresenter = basePresenter as? BasePresenterProtocol

        basePresenter.baseView = baseView as? BaseViewProtocol
        basePresenter.baseRouter = baseRouter as? BaseRouterProtocol
        basePresenter.baseInteractor = baseInteractor as? BaseInteractorInputProtocol

        baseRouter.baseView = baseView
        baseRouter.delegate = basePresenter

        baseInteractor.basePresenter = basePresenter as? BaseInteractorOutputProtocol

        return (baseView, basePresenter, baseInteractor, baseRouter)
    }
}
