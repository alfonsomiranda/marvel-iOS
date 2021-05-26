//
//  CharacterProviderMock.swift
//  MarvelTests
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
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
