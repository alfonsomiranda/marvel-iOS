//
//  CharacterPresenterMock.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 28/02/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import Foundation
@testable import Marvel

class ListPresenterMock: ListPresenterProtocol {
    var isViewDidLoadCalled = false
    var isSetCharactersCalled = false
    var isShowErrorCharactersCalled = false
    var isNetworkErrorHappened = false
    var isLoadCharactersCalled = false
    
    func viewDidLoad() {
        self.isViewDidLoadCalled = true
    }
}

extension ListPresenterMock: ListInteractorOutputProtocol {
    func setCharacters(characters: [CharacterBusinessModel]) {
        self.isSetCharactersCalled = true
    }
    
    func showErrorCharacters(error: CustomErrorModel) {
        self.isShowErrorCharactersCalled = true
    }
    
    func networkErrorHappened() {
        self.isNetworkErrorHappened = true
    }
    
    func loadCharacters() {
        self.isLoadCharactersCalled = true
    }
    
}
