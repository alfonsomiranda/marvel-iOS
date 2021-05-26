//
//  DataAssembly.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
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
