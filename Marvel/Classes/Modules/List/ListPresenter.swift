//
//  ListPresenter.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import UIKit

protocol ListPresenterProtocol: BasePresenterProtocol {
    func loadCharacters()
}

class ListPresenter: BasePresenter {
    
    weak var view: ListViewProtocol? {
        return super.baseView as? ListViewProtocol
    }
    
    var router: ListRouterProtocol? {
        return super.baseRouter as? ListRouterProtocol
    }
    
    var interactor: ListInteractorInputProtocol? {
        return super.baseInteractor as? ListInteractorInputProtocol
    }
    
    var characterList: [CharacterViewModel] = []
    weak var tablePresenterDelegate: TablePresenterDelegate?
    
    var limit: Int = 20
    var offset: Int = 0
    
    override func showNetworkErrorAlert() {
        super.showNetworkErrorAlert()
        
        self.viewWithError()
    }
    
    fileprivate func viewWithError() {
        if self.offset == 0 {
            self.view?.blankState(shows: true)
            self.view?.listStatus(shows: false)
        }
    }
}

extension ListPresenter: ListPresenterProtocol {

    func viewDidLoad() {
        self.view?.setTitle(title: LocalizedKeys.List.mainTitle)
        
        self.loadCharacters()
    }
    
    func loadCharacters() {
        self.interactor?.getCharacters(limit: self.limit, offset: self.offset)
    }
}

extension ListPresenter: ListInteractorOutputProtocol {
    func setCharacters(characters: [CharacterBusinessModel]) {
        self.view?.blankState(shows: false)
        self.view?.listStatus(shows: true)
        
        let characters = characters.map { CharacterViewModel(businessModel: $0) }
        self.characterList.append(contentsOf: characters)
        self.tablePresenterDelegate?.dataSourceUpdated(.unspecified)
    }
    
    func showErrorCharacters(error: CustomErrorModel) {
        self.showError(error: error)
        self.viewWithError()
    }
}

extension ListPresenter: TablePresenterProtocol {
    func numberOfCells(_ tableType: TableType, section: Int) -> Int {
        return self.characterList.count
    }
    
    func object(_ tableType: TableType, indexPath: IndexPath) -> Any {
        return self.characterList[indexPath.row]
    }
    
    func didTapRow(_ tableType: TableType, indexPath: IndexPath) {
        let character = self.characterList[indexPath.row]
        if let id = character.id {
            self.router?.navigateToDetail(id: id)
        }
    }
    
    func heightForRow(_ tableType: TableType, indexPath: IndexPath) -> Int {
        return 100
    }
    
    func willDisplay(_ tableType: TableType, indexPath: IndexPath, isLast: Bool) {
        if isLast {
            self.offset += self.limit
            self.interactor?.getCharacters(limit: self.limit, offset: self.offset)
        }
    }
}
