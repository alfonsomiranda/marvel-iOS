//
//  DetailInteractorMock.swift
//  MarvelTests
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
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
