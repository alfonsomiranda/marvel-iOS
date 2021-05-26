//
//  CardCellDrawer.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

class CharacterCellDrawer {
    
    static func cell(model: CharacterViewModel, tableView: UITableView, presenter: Any?) -> UITableViewCell {
        
        guard let cell = BaseTableViewCell<Any>.createBaseCell(tableView: tableView, cell: CharacterTableViewCell.self, cellName: "CharacterTableViewCell", model: model) else { return UITableViewCell() }
        
        return cell
    }
}
