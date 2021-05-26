//
//  GlobalPositionRouter.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation

protocol ListRouterProtocol: BaseRouterProtocol {
    func navigateToDetail(id: Int)
}

final class ListRouter: BaseRouter {
    
    weak var view: ListViewController? {
        return super.baseView as? ListViewController
    }    
}

extension ListRouter: ListRouterProtocol {
    func navigateToDetail(id: Int) {
        self.pushViewController(DetailAssembly.detailView(detailAssemblyDTO: DetailAssemblyDTO(id: id)), animated: true)
    }
}
