//
//  ErrorLoginModel.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation

class ErrorModel: BaseBusinessModel {
    
    var code: String?
    var status: String?
    var message: String?
    
    required init(serverModel: BaseServerModel?) {
        super.init(serverModel: serverModel)
        
        guard let serverModel = serverModel as? ErrorServerModel else { return }
        self.code = serverModel.code
        self.status = serverModel.status
        self.message = serverModel.message
    }
}
