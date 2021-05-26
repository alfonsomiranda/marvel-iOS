//
//  DetailPresenterMock.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 01/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
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
