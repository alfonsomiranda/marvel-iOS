//
//  CharactersBussinesModel.swift
//  Marvel
//
//  Created by Alfonso Miranda Castro on 27/02/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import Foundation

class CharactersBusinessModel: BaseBusinessModel {
    var characters: [CharacterBusinessModel]?
    
    required init(serverModel: BaseServerModel?) {
        super.init(serverModel: serverModel)

        guard let serverModel = serverModel as? CharactersServerModel else { return }
        if let charactersServerModel = serverModel.data?.results {
            self.characters = charactersServerModel.map { CharacterBusinessModel(serverModel: $0) }
        }
    }
}

class CharacterBusinessModel: BaseBusinessModel {
    var id: Int?
    var name, resultDescription: String?
    var smallImageUrl: String?
    var largeImageUrl: String?
    var comics, series: Comics?

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case thumbnail, comics, series
    }
    
    required init(serverModel: BaseServerModel?) {
        super.init(serverModel: serverModel)
        
        guard let serverModel = serverModel as? CharacterServerModel else { return }
        self.id = serverModel.id
        self.name = serverModel.name
        self.resultDescription = serverModel.resultDescription
        if let path = serverModel.thumbnail?.path?.securePath(), let thumbnailExtension = serverModel.thumbnail?.thumbnailExtension {
            self.smallImageUrl = path + "/portrait_small." + thumbnailExtension
        }
        if let path = serverModel.thumbnail?.path?.securePath(), let thumbnailExtension = serverModel.thumbnail?.thumbnailExtension {
            self.largeImageUrl = path + "/portrait_incredible." + thumbnailExtension
        }
        self.comics = serverModel.comics
        self.series = serverModel.series
    }
}
