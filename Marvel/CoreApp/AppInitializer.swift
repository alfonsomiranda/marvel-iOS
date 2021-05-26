//
//  AppInitializer.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

class AppInitializer: NSObject {
    func installRootViewController() {
        BaseRouter.setRoot(navigationController: ListAssembly.listNavigationView())
    }
}
