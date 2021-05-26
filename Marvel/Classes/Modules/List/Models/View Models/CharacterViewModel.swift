//
//  CharacterViewModel.swift
//  Marvel
//
//  Created by Alfonso Miranda Castro on 27/02/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
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
