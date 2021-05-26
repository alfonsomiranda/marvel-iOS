//
//  CustomTableView.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit
struct CustomTableView {
    
    var type: TableType
    var tableView: UITableView
    
    init(type: TableType = .unspecified, tableView: UITableView) {
        self.type = type
        self.tableView = tableView
    }
}
