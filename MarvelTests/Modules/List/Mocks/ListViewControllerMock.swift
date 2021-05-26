//
//  ListViewControllerMock.swift
//  MarvelTests
//
//  Created by Alfonso Miranda Castro on 01/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
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
