//
//  CharacterProvider.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation

protocol CharacterProviderProtocol {
    func characterList(dto: CharacterDTO, success: @escaping (CharactersServerModel) -> Void, failure: @escaping (CustomErrorModel) -> Void)
}

class CharacterProvider: BaseProvider {
    
}

extension CharacterProvider: CharacterProviderProtocol {
    func characterList(dto: CharacterDTO, success: @escaping (CharactersServerModel) -> Void, failure: @escaping (CustomErrorModel) -> Void) {
        let providerDTO = CharacterProviderRequest.getCharacterConstants(params: dto)
        _ = self.request(dto: providerDTO,
                         success: { (data) in
                            if let serverModel = BaseProviderUtils.parseToServerModel(parserModel: CharactersServerModel.self, data: data) {
                                success(serverModel)
                            }
                            
        }, failure: { (error) in
            failure(error)
        })
    }
}

// MARK: - Structs

struct CharacterDTO: BaseProviderParamsDTO {
    var id: Int?
    var limit: Int?
    var offset: Int?
}

struct CharacterProviderRequest {
    static func getCharacterConstants(params: BaseProviderParamsDTO?) -> ProviderDTO {
        let id = (params as? CharacterDTO)?.id ?? -1
        let endpoint = URLEndpoint.characters + ((id != -1) ? "/\(id)" : "")
        
        return ProviderDTO(params: params?.encode(),
                           method: .get,
                           urlContext: .backend,
                           endpoint: endpoint)
    }
}
