//
//  DetailRouter.swift
//  Marvel
//
//  Created by Alfonso Miranda Castro on 28/02/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
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
