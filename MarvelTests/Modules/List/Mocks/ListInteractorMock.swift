//
//  ListInteractorMock.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 01/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import Foundation
@testable import Marvel

class ListInteractorMock: ListInteractorInputProtocol {
    var listAssemblyDTO: ListAssemblyDTO?
    
    var provider: CharacterProviderProtocol?
    
    var isGetCharactersCalled: Bool = false
    var getCharactersSuccess: Bool = false
    
    func getCharacters(limit: Int, offset: Int) {
        self.isGetCharactersCalled = true
    }
}
