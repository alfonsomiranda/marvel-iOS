//
//  CharacterViewModel.swift
//  Marvel
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation

class CharacterViewModel: BaseViewModel {
    var id: Int?
    var name: String?
    var characterDescription: String?
    var thumbnailImage: String?
    
    required init(businessModel: BaseBusinessModel?) {
        super.init(businessModel: businessModel)
        
        guard let businessModel = businessModel as? CharacterBusinessModel else { return }
        
        self.id = businessModel.id
        self.name = businessModel.name
        self.characterDescription = (businessModel.resultDescription?.length ?? 0 > 0) ? businessModel.resultDescription : LocalizedKeys.CharacterViewModel.noDescription
        self.thumbnailImage = businessModel.smallImageUrl
    }
}
