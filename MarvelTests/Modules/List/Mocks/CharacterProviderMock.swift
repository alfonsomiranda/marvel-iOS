//
//  CharacterProviderMock.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 28/02/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import Foundation
@testable import Marvel

class CharacterProviderMock: CharacterProviderProtocol {
    var isCharacterListCalled = false
    var isSuccess = false
    
    func characterList(dto: CharacterDTO, success: @escaping (CharactersServerModel) -> Void, failure: @escaping (CustomErrorModel) -> Void) {
        self.isCharacterListCalled = true
        if isSuccess {
            if let characters = CharactersServerModel.charactersMock() {
                success(characters)
            }
        } else {
            failure(CustomErrorModel(httpClientError: .unknownError, backendError: .unknownError))
        }
    }
}

extension CharactersServerModel {
    static func charactersMock() -> CharactersServerModel? {
        let data = BaseProviderUtils.getData(name: "charactersMock", withExtension: "json", forClass: CharacterProviderMock.self)
        let charactersServerModel = BaseProviderUtils.parseToServerModel(parserModel: CharactersServerModel.self, data: data)
        return charactersServerModel
    }
}
