//
//  BaseTableViewCell.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewCell<CellModel: Any>: UITableViewCell {
    
    var cellModel: CellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        self.clear()
    }
    
    func setup() {
        self.selectionStyle = .none
    }
    
    func clear() {}
    
    func configure(cellModel: CellModel) {
        self.cellModel = cellModel
    }
}

extension BaseTableViewCell {
    
    static func createCell<T: UITableViewCell>(tableView: UITableView, cell: T.Type, cellName: String) -> T? {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellName) as? T
        if cell == nil {
            tableView.register(UINib(nibName: cellName, bundle: .main), forCellReuseIdentifier: cellName)
            cell = tableView.dequeueReusableCell(withIdentifier: cellName) as? T
        }
        
        return cell
    }
    
    static func createBaseCell<CellModel: Any, CellClass: BaseTableViewCell<CellModel>>(tableView: UITableView, cell: CellClass.Type, cellName: String, model: CellModel) -> CellClass? {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellName) as? CellClass
        if cell == nil {
            tableView.register(UINib(nibName: cellName, bundle: .main), forCellReuseIdentifier: cellName)
            cell = tableView.dequeueReusableCell(withIdentifier: cellName) as? CellClass
        }
        
        cell?.configure(cellModel: model)
        
        return cell
    }
}
