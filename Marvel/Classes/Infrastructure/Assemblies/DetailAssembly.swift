//
//  DetailAssembly.swift
//  Marvel
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
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
