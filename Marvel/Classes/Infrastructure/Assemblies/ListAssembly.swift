//
//  ListAssembly.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

final class ListAssembly: BaseAssembly {
    
    static func listNavigationView(listAssemblyDTO: ListAssemblyDTO? = nil) -> UINavigationController {
        return UINavigationController(rootViewController: listView(listAssemblyDTO: listAssemblyDTO))
    }
    
    static func listView(listAssemblyDTO: ListAssemblyDTO? = nil) -> ListViewController {
        let view = ListViewController(nibName: Utils.getXib(xibFile: .listView), bundle: nil)
        
        let viper =  BaseAssembly.assembly(baseView: view,
                                           presenter: ListPresenter.self,
                                           router: ListRouter.self,
                                           interactor: ListInteractor.self)
        
        viper.interactor.listAssemblyDTO = listAssemblyDTO
        viper.interactor.provider = DataAssembly.characterProvider(interactor: viper.interactor)
        
        return view
    }
}

struct ListAssemblyDTO {
    
}
