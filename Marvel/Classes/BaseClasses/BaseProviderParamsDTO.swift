//
//  BaseProviderParamsDTO.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation

protocol BaseProviderParamsDTO: Codable {
    
}

extension BaseProviderParamsDTO {
    
    func encode() -> [String: Any] {
        
        guard let jsonData = try? JSONEncoder().encode(self),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
            else { return [String: Any]() }

        return json
    }
    
}

extension Array where Element: BaseProviderParamsDTO {
    
    func encode() -> [[String: Any]] {
        
        guard let jsonData = try? JSONEncoder().encode(self),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]]
            else { return [[String: Any]]() }

        return json
    }
    
}
