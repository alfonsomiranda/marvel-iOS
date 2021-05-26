//
//  ListViewControllerMock.swift
//  MarvelTests
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation
@testable import Marvel

class ListViewControllerMock: ListViewProtocol {
    var isSetTitleCalled: Bool = false
    var title: String = ""
    
    func setTitle(title: String) {
        self.isSetTitleCalled = true
        self.title = title
    }
    
    func listStatus(shows: Bool) {
        
    }
    
    func blankState(shows: Bool) {
        
    }
    
    func showAlertWith(title: String?, message: String?, actions: [CustomAlertAction]?) {
        
    }
    
    func showLoading(fullScreen: Bool) {
        
    }
    
    func hideLoading() {
        
    }
}
