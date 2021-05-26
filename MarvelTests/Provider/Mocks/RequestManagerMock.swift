//
//  RequestManagerMock.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 02/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import Foundation
@testable import Marvel

class RequestManagerMock: RequestManager {
    //swiftlint:disable function_parameter_count
    
    weak var delegate: BaseProviderDelegate?
    
    var isRequestSuccessCalled = false
    var isRequestFailureCalled = false
    var isSuccess = false
    
    func request(dto: ProviderDTO, timeout: TimeInterval, printLog: Bool, encrypted: Bool, additionalHeader: [String: String], success: @escaping (Data?) -> Void, failure: @escaping (CustomErrorModel) -> Void) -> URLSessionTask? {
        if isSuccess {
            self.isRequestSuccessCalled = true
            success(Data())
        } else {
            self.isRequestFailureCalled = true
            failure(CustomErrorModel(httpClientError: .unknownError, backendError: .unknownError))
        }
        
        return nil
    }
}
