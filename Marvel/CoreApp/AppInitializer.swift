//
//  AppInitializer.swift
//
//  Created by Alfonso Miranda on 26/02/2020.
//  Copyright © 2019 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

class AppInitializer: NSObject {
    func installRootViewController() {
        BaseRouter.setRoot(navigationController: ListAssembly.listNavigationView())
    }
}
