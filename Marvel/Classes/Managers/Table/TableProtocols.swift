//
//  TableProtocols.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation

// Protocol used to the View can communicate with Presenter
protocol TablePresenterProtocol: AnyObject {
    
    var tablePresenterDelegate: TablePresenterDelegate? { get set }
    
    func numberOfCells(_ tableType: TableType, section: Int) -> Int
    func object(_ tableType: TableType, indexPath: IndexPath) -> Any
    func didTapRow(_ tableType: TableType, indexPath: IndexPath)
    func heightForRow(_ tableType: TableType, indexPath: IndexPath) -> Int
    func willDisplay(_ tableType: TableType, indexPath: IndexPath, isLast: Bool)
}

extension TablePresenterProtocol {
    
    func didTapRow(_ tableType: TableType, indexPath: IndexPath) {}
    func heightForRow(_ tableType: TableType, indexPath: IndexPath) -> Int { return 44 }
    func willDisplay(_ tableType: TableType, indexPath: IndexPath, isLast: Bool) {}
}

protocol TablePresenterDelegate: AnyObject {
    func dataSourceUpdated(_ tableType: TableType)
}
