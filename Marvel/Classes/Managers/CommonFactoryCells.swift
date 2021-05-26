//
//  CommonFactoryCells.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import UIKit

class CommonFactoryCells: NSObject {
    
    class func view(for object: Any?, tableView: UITableView, delegate: Any? = nil) -> UIView {
        return self.cell(for: object, tableView: tableView, delegate: delegate).contentView
    }
    
    class func cell(for object: Any?, tableView: UITableView, delegate: Any? = nil) -> UITableViewCell {
        switch object {
        case let model as CharacterViewModel:
            return CharacterCellDrawer.cell(model: model, tableView: tableView, presenter: delegate)
        default:
            return UITableViewCell()
        }
    }
}
