//
//  DetailInteractorMock.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 01/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import Foundation
@testable import Marvel

class DetailInteractorMock: DetailInteractorInputProtocol {
    var detailAssemblyDTO: DetailAssemblyDTO?
    
    var isGetCharacterDetailIsCalled = false
    
    func getCharacterDetail() {
        self.isGetCharacterDetailIsCalled = true
    }
}
