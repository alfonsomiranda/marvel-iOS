//
//  DetailInteractor.swift
//  Marvel
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation

protocol DetailInteractorInputProtocol: BaseInteractorInputProtocol {
    var detailAssemblyDTO: DetailAssemblyDTO? { get set }
    
    func getCharacterDetail()
}

protocol DetailInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setCharacter(character: CharacterBusinessModel)
    func characterDetailError(error: CustomErrorModel)
}

class DetailInteractor: BaseInteractor {
    var detailAssemblyDTO: DetailAssemblyDTO?
    var provider: CharacterProviderProtocol? 
    weak var presenter: DetailInteractorOutputProtocol? { return super.basePresenter as? DetailInteractorOutputProtocol }
}

extension DetailInteractor: DetailInteractorInputProtocol {
    func getCharacterDetail() {
        self.provider?.characterList(dto: CharacterDTO(id: detailAssemblyDTO?.id), success: { (charactersServerModel) in
            if let characterDetailServerModel = charactersServerModel.data?.results?.first {
                if let characterBussiness = BaseInteractor.parseToBusinessModel(parserModel: CharacterBusinessModel.self, serverModel: characterDetailServerModel) {
                    self.presenter?.setCharacter(character: characterBussiness)
                }
            }
        }, failure: { (error) in
            self.presenter?.characterDetailError(error: error)
        })
    }
}
