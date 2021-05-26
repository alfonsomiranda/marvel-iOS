//
//  DetailRouter.swift
//  Marvel
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation

protocol DetailRouterProtocol: BaseRouterProtocol {
    func goBack()
}

class DetailRouter: BaseRouter {
    
}

extension DetailRouter: DetailRouterProtocol {
    func goBack() {
        self.popViewController(animated: true)
    }
}
