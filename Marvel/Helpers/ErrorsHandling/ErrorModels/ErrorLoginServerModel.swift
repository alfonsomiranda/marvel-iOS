//
//  ErrorLoginServerModel.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation

struct ErrorServerModel: BaseServerModel {
    
    let code: String?
    let status: String?
    let message: String?
}
