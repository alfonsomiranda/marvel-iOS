//
//  DataAssembly.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation

struct DataAssembly {
    
    // MARK: Characters Provider
    static func characterProvider(interactor: BaseInteractor) -> CharacterProviderProtocol {
        let provider = CharacterProvider()
        provider.delegate = interactor
        provider.manager = NativeManager()
        return provider
    }
}
