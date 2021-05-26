//
//  GlobalPositionRouter.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
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
