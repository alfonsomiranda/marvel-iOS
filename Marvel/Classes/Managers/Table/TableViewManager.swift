//
//  TableViewManager.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

enum TableType {
    case list
    case detail
    case unspecified
}

class TableViewManager: NSObject {
    
    var arrayTableViews: [CustomTableView] = []
    weak var presenter: TablePresenterProtocol?
    
    init(arrayTableViews: [CustomTableView],
         presenter: Any?) {
        super.init()
        
        self.arrayTableViews = arrayTableViews
        self.presenter = presenter as? TablePresenterProtocol
        self.presenter?.tablePresenterDelegate = self
        
        self.setup()
    }
    
    func setup() {
        
        for customTable in self.arrayTableViews {

            customTable.tableView.delegate = self
            customTable.tableView.dataSource = self
        
            customTable.tableView.clipsToBounds = true
            customTable.tableView.separatorStyle = .singleLine
            customTable.tableView.separatorColor = UIColor.white
            customTable.tableView.separatorInset = .zero
            customTable.tableView.showsVerticalScrollIndicator = false
            customTable.tableView.keyboardDismissMode = .interactive
            customTable.tableView.tableFooterView = UIView(frame: .zero)
            customTable.tableView.estimatedRowHeight = 44
            customTable.tableView.sectionHeaderHeight = UITableView.automaticDimension
            customTable.tableView.rowHeight = UITableView.automaticDimension
        }
    }
}

extension TableViewManager: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = self.findCustomTableView(tableView, arrayCustomTables: self.arrayTableViews)?.type ?? .unspecified
        return self.presenter?.numberOfCells(type, section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = self.findCustomTableView(tableView, arrayCustomTables: self.arrayTableViews)?.type ?? .unspecified
        return CommonFactoryCells.cell(for: self.presenter?.object(type, indexPath: indexPath), tableView: tableView, delegate: self.presenter)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = self.findCustomTableView(tableView, arrayCustomTables: self.arrayTableViews)?.type ?? .unspecified
        self.presenter?.didTapRow(type, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = self.findCustomTableView(tableView, arrayCustomTables: self.arrayTableViews)?.type ?? .unspecified
        return CGFloat(self.presenter?.heightForRow(type, indexPath: indexPath) ?? 0)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let type = self.findCustomTableView(tableView, arrayCustomTables: self.arrayTableViews)?.type ?? .unspecified
        let lastElement = tableView.numberOfRows(inSection: indexPath.section) - 1
        let isLast = (indexPath.row == lastElement)
        self.presenter?.willDisplay(type, indexPath: indexPath, isLast: isLast)
    }
}

extension TableViewManager: TablePresenterDelegate {
    
    func dataSourceUpdated(_ tableType: TableType) {
        self.findTableView(tableType, arrayCustomTables: self.arrayTableViews)?.reloadData()
    }
}

extension TableViewManager {
    func findCustomTableView(_ tableView: UITableView, arrayCustomTables: [CustomTableView]) -> CustomTableView? {
        return arrayTableViews.filter({$0.tableView == tableView}).first
    }
    
    func findTableView(_ tableType: TableType, arrayCustomTables: [CustomTableView]) -> UITableView? {
        return arrayTableViews.filter({$0.type == tableType}).first?.tableView
    }
}
