//
//  Utils.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class Utils {
    
    static var alert: UIAlertController?
    
    static func getXib(xibFile: XibFile) -> String {
        return xibFile.rawValue
    }
    
    static func showAlertWith(title: String?, message: String?, actions: [UIAlertAction]? = nil) {
        
        self.alert?.dismiss(animated: false, completion: nil)
        self.alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        guard let alert = self.alert else { return }
        
        if let actions = actions {
            for action in actions {
                alert.addAction(action)
            }
        } else {
            alert.addAction(UIAlertAction(title: "accept".localized, style: UIAlertAction.Style.default, handler: nil))
        }
        
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindow.Level.alert + 1
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    static func getAuthorizationHeader() -> [String: String] {
        return [Constants.userTokenHeader: Session.shared.loginToken]
    }
    
    static func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        
        #if DEBUG
        
        var idx = items.startIndex
        let endIdx = items.endIndex
        
        repeat {
            Swift.print(items[idx], separator: separator, terminator: idx == (endIdx - 1) ? terminator : separator)
            idx += 1
        }
            while idx < endIdx
        
        #endif
    }

}
