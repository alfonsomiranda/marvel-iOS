//
//  CustomTableView.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
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
