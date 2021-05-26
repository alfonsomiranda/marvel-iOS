//
//  BasePresenter.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import UIKit

// Base class, it is declared as a good practice to implement new functions in a global way in the application.
class BasePresenter {
    
    // Declared weak for the ARC to destroy them.
    internal weak var baseView: BaseViewProtocol?
    internal var baseRouter: BaseRouterProtocol?
    internal var baseInteractor: BaseInteractorInputProtocol?
    
    required init() {}
        
    // MARK: Logout
    static func logout() {
        
        BaseInteractor.removeDataForLogout()
        BaseRouter.logout()
    }
    
    // MARK: Alerts
    func showAlert(error: CustomErrorModel) {
    
        self.baseView?.showAlertWith(title: "Error".localized, message: error.presentationMessage, actions: nil)
    }
    
    func showNetworkErrorAlert() {
        self.baseView?.showAlertWith(title: "Error".localized, message: "Network_error".localized, actions: nil)
    }
    
    func invalidCredentialsError() {
        
        let action = CustomAlertAction(title: "Aceptar".localized) { _ in
            BasePresenter.logout()
        }
        
        self.baseView?.showAlertWith(title: "Error".localized, message: "Logut".localized, actions: [action])
    }
}

// MARK: BasePresenterProtocol
extension BasePresenter {
    
    func showError(error: CustomErrorModel) {
        
//        if error.httpClientError.type == .networkError {
//            self.showNetworkErrorAlert()
//            return
//        }
//        
//        switch error.backendError.type {
//        case .tokenInvalid:
//            
//            self.invalidCredentialsError()
//            
//        default:
//            self.showAlert(error: error)
//        }
        self.showAlert(error: error)
    }
}

// MARK: BaseInteractorOutputProtocol
extension BasePresenter {
    
    func genericErrorHappened(error: CustomErrorModel) {
         self.showError(error: error)
     }
    
    func asyncTaskStarted() {
        self.baseView?.showLoading(fullScreen: true)
    }
    
    func asyncTaskFinished() {
        self.baseView?.hideLoading()
    }
    
    func networkErrorHappened() {
        self.showNetworkErrorAlert()
    }
}

extension BasePresenter: BaseRouterDelegate {

    func navigationDone() {
        
        // Do something every time a navigation is done
        // If you cannot, for example, an invalid credentials error is displayed
        //            BasePresenter.invalidCredentialsError()
    }
}
