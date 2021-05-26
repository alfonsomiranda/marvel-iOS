//
//  ListViewController.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import UIKit

protocol ListViewProtocol: BaseViewProtocol {
    func setTitle(title: String)
    func listStatus(shows: Bool)
    func blankState(shows: Bool)
}

class ListViewController: BaseViewController {

    var presenter: ListPresenterProtocol? {
        return super.basePresenter as? ListPresenterProtocol
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var reloadButton: UIButton!
    
    var tableViewManager: TableViewManager?
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customizeUI()
        
        self.tableViewManager = TableViewManager(arrayTableViews: [CustomTableView(tableView: self.tableView)], presenter: self.presenter)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: IBActions declaration of all the controls
    
    @IBAction func reloadAction() {
        self.presenter?.loadCharacters()
    }
    
    // MARK: Private Functions

    fileprivate func customizeUI() {
        self.reloadButton.setTitle(LocalizedKeys.List.reloadButtonTitle, for: .normal)
        self.reloadButton.layer.cornerRadius = 10
    }
}

extension ListViewController: ListViewProtocol {
    func listStatus(shows: Bool) {
        self.tableView.isHidden = !shows
    }
    
    func blankState(shows: Bool) {
        self.reloadButton.isHidden = !shows
    }
    
    func setTitle(title: String) {
        self.title = title
    }
}
