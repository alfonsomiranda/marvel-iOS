//
//  DetailAssembly.swift
//  Marvel
//
//  Created by Alfonso Miranda Castro on 29/02/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import Foundation

final class DetailAssembly: BaseAssembly {
    
    static func detailView(detailAssemblyDTO: DetailAssemblyDTO? = nil) -> DetailViewController {
        let view = DetailViewController(nibName: Utils.getXib(xibFile: .detailView), bundle: nil)
        
        let viper =  BaseAssembly.assembly(baseView: view,
                                           presenter: DetailPresenter.self,
                                           router: DetailRouter.self,
                                           interactor: DetailInteractor.self)
        
        viper.interactor.detailAssemblyDTO = detailAssemblyDTO
        viper.interactor.provider = DataAssembly.characterProvider(interactor: viper.interactor)
        
        return view
    }
}

struct DetailAssemblyDTO {
    var id: Int?
}
