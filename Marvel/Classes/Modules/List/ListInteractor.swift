//
//  ListInteractor.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation

protocol ListInteractorInputProtocol: BaseInteractorInputProtocol {
    var listAssemblyDTO: ListAssemblyDTO? { get set }
    var provider: CharacterProviderProtocol? { get set }
    func getCharacters(limit: Int, offset: Int)
}

protocol ListInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setCharacters(characters: [CharacterBusinessModel])
    func showErrorCharacters(error: CustomErrorModel)
}

class ListInteractor: BaseInteractor {
    
    // MARK: VIPER Dependencies
    weak var presenter: ListInteractorOutputProtocol? { return super.basePresenter as? ListInteractorOutputProtocol }
    var provider: CharacterProviderProtocol?    
    
    var listAssemblyDTO: ListAssemblyDTO?
    
    func getCharacters(limit: Int, offset: Int) {
        var dto = CharacterDTO()
        dto.limit = limit
        dto.offset = offset
        
        self.provider?.characterList(dto: dto, success: { (charactersServerModel) in
            let businessModel = BaseInteractor.parseToBusinessModel(parserModel: CharactersBusinessModel.self, serverModel: charactersServerModel)
            if let characters = businessModel?.characters {
                self.presenter?.setCharacters(characters: characters)
            }
        }, failure: { (error) in
            self.presenter?.showErrorCharacters(error: error)
        })
    }
    
}

extension ListInteractor: ListInteractorInputProtocol {
    
}
