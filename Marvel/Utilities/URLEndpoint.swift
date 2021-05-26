//
//  URLEndpoint.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

struct URLEndpoint {
    public enum BaseURLContext {
        case backend
    }
    
    static var characters = "characters"
}

extension URLEndpoint {
    static func buildURL(urlContext: BaseURLContext, endpoint: String) -> String {
        switch urlContext {
        case .backend:
            return MarvelApiConstants.serverURL + MarvelApiConstants.version + "/public" + "/\(endpoint)" + "?apikey=\(MarvelApiConstants.apiKey)&ts=\(MarvelApiConstants.timeStamp)&hash=\(MarvelApiConstants.hash)"
        }
    }
}
