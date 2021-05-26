//
//  CustomErrorAction.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation

struct CustomAlertAction {
    
    var title: String
    var handler: ((CustomAlertAction) -> Void)?
    
    init(title: String,
         handler: ((CustomAlertAction) -> Void)? = nil) {
        
        self.title = title
        self.handler = handler
    }
}
