//
//  CustomErrorAction.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
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
