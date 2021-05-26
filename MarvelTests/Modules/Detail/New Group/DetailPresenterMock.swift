//
//  DetailPresenterMock.swift
//  MarvelTests
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation
@testable import Marvel

class DetailPresenterMock: DetailPresenterProtocol {
    var isViewDidLoadCalled = false
    var isSetCharacterCalled = false
    var isNetworkErrorHappenedCalled = false
    var isSetCharacterDetailErrorCalled = false
    
    func viewDidLoad() {
        self.isViewDidLoadCalled = true
    }
}

extension DetailPresenterMock: DetailInteractorOutputProtocol {
    func setCharacter(character: CharacterBusinessModel) {
        self.isSetCharacterCalled = true
    }
    
    func networkErrorHappened() {
        self.isNetworkErrorHappenedCalled = true
    }
    
    func characterDetailError(error: CustomErrorModel) {
        self.isSetCharacterDetailErrorCalled = true
    }
}
