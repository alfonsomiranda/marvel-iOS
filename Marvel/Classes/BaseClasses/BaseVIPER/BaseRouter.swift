//
//  BaseRouter
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

class BaseRouter {
    
    // Declared weak for the ARC to destroy them.
    internal weak var baseView: UIViewController?
    weak var delegate: BaseRouterDelegate?
    
    required init() {}
    
    static func setRoot(navigationController: UIViewController) {
        
        guard let window = UIApplication.shared.delegate?.window else { return }
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    static func logout(viewController: UIViewController? = nil) {
        
        if let navigationController = (UIApplication.shared.windows.first?.rootViewController as? UINavigationController) {
            
            navigationController.popToRootViewController(animated: true)
            
        } else {
            
            if let viewController = viewController {
                viewController.dismiss(animated: true, completion: nil)
            }
            if let navigationController = (UIApplication.shared.windows.first?.rootViewController as? UINavigationController) {
                navigationController.popToRootViewController(animated: true)
            }
        }
    }
    
    // MARK: PRIVATE BASE
    internal func rootViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
        self.delegate?.navigationDone()
        self.baseView?.navigationController?.setViewControllers([viewControllerToPresent], animated: flag)
    }
    
    internal func pushViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
        self.delegate?.navigationDone()
        self.baseView?.navigationController?.pushViewController(viewControllerToPresent, animated: flag)
    }
    
    internal func popViewController(animated: Bool) {
        self.delegate?.navigationDone()
        self.baseView?.navigationController?.popViewController(animated: animated)
    }
    
    internal func popToViewController(toViewController: UIViewController, animated: Bool) {
        self.delegate?.navigationDone()
        self.baseView?.navigationController?.popToViewController(toViewController, animated: animated)
    }
    
    internal func popToRootViewController() {
        self.delegate?.navigationDone()
        self.baseView?.navigationController?.popToRootViewController(animated: true)
    }
    
    internal func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        self.delegate?.navigationDone()
        self.baseView?.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    internal func dismiss(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        self.delegate?.navigationDone()
        self.baseView?.dismiss(animated: flag, completion: completion)
    }
}
