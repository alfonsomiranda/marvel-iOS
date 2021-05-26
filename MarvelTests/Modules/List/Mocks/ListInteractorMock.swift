//
//  ListInteractorMock.swift
//  MarvelTests
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
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
