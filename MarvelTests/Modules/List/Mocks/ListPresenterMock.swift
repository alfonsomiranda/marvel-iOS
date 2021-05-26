//
//  CharacterPresenterMock.swift
//  MarvelTests
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
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
