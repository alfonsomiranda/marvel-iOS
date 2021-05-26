//
//  DetailPresenter.swift
//  Marvel
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation

protocol DetailPresenterProtocol: BasePresenterProtocol {
    
}

class DetailPresenter: BasePresenter {
    weak var view: DetailViewProtocol? {
        return super.baseView as? DetailViewProtocol
    }
    
    var interactor: DetailInteractorInputProtocol? {
        return super.baseInteractor as? DetailInteractorInputProtocol
    }
    
    var router: DetailRouterProtocol? {
        return super.baseRouter as? DetailRouterProtocol
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    func viewDidLoad() {
        self.interactor?.getCharacterDetail()
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func setCharacter(character: CharacterBusinessModel) {
        self.view?.setTitile(title: character.name ?? "")
        self.view?.setInfo(title: character.name ?? "", description: character.resultDescription ?? "", image: character.largeImageUrl ?? "", comics: character.comics?.items?.count ?? 0, series: character.series?.items?.count ?? 0)
    }
    
    func characterDetailError(error: CustomErrorModel) {
        self.showError(error: error)
    }
}
