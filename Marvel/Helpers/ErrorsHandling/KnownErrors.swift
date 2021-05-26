//
//  KnownErrors.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation

public struct HTTPClientError: Error {
    
    var type: ErrorType = .unknownError
    
    enum ErrorType: Int {
        case internalServerError = 500
        case conflictErrpr = 409
        case invalidCredentials = 412
        
        case unknownError
    }
    
    init(code: Int) {
        self.type = .unknownError
        switch code {
        case -1:
            self.type = .invalidCredentials
        case 401..<414:
             self.type = .invalidCredentials
        case 409:
             self.type = .conflictErrpr
        default:
             self.type
                = .unknownError
        }
    }
}

public struct BackendError: Error {
    
    var type: ErrorType = .limitGreater
    var code: String = ""
    var serverMessage = ""
    var errorText = ""
    
    enum ErrorType: String {
        case limitGreater = "409"
        case invalidCredentials = "InvalidCredentials"
        case unknownError = ""
    }
    
    init(code: String, serverMessage: String) {
        
        self.type = ErrorType(rawValue: code) ?? .unknownError
        self.errorText = BackendError.getErrorTextFrom(self.type)
        self.serverMessage = serverMessage
    }
    
    static func getErrorTextFrom(_ type: ErrorType) -> String {
        switch type {
        case .limitGreater:
            return "login_error_blocked_user".localized
        case .invalidCredentials:
            return "invalid_credentials_error".localized
        default:
            return "error_generic".localized
        }
    }
}
