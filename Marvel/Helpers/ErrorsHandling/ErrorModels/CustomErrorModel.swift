//
//  CustomErrorModel.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation

class CustomErrorModel: NSError {
    
    var type: String = "Backend"
    var internalCode: String = ""
    var presentationMessage = ""
    var originalObject: Any?
    
    var httpClientError = HTTPClientError(code: -1)
    var backendError = BackendError(code: "", serverMessage: "")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(httpClientError: HTTPClientError.ErrorType, backendError: BackendError.ErrorType) {
        
        self.httpClientError = HTTPClientError(code: httpClientError.rawValue)
        self.backendError = BackendError(code: backendError.rawValue, serverMessage: "")
        let defaultDomain = "error_generic".localized
        self.presentationMessage = self.backendError.errorText

        super.init(domain: defaultDomain, code: self.httpClientError.type.rawValue, userInfo: nil)

    }
    
    init(data: Data?, httpCode: Int?) {

        self.httpClientError = HTTPClientError(code: httpCode ?? -1)
        
        let defaultDomain = "error_generic".localized
        let defaultCode = self.httpClientError.type.rawValue
        
        guard let data = data else {
            super.init(domain: defaultDomain, code: defaultCode, userInfo: nil)
            self.presentationMessage = defaultDomain
            return
        }
        
        if  let errorModelModel = try? JSONDecoder().decode(ErrorServerModel.self, from: data) {
            
            let errorModel = ErrorModel(serverModel: errorModelModel)
            let domain = errorModel.message ?? defaultDomain
            super.init(domain: domain,
                       code: defaultCode,
                       userInfo: nil)
            
            self.originalObject = errorModel
            self.internalCode = errorModel.status ?? ""
            
            self.backendError = BackendError(code: "\(errorModel.code ?? "")", serverMessage: errorModel.message ?? "")
            self.presentationMessage = backendError.errorText
            return
        }
        
        super.init(domain: defaultDomain, code: defaultCode, userInfo: nil)
        self.presentationMessage = self.backendError.errorText
    }
}
