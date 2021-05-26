//
//  NavigationBarButtonItem.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

struct NavigationBarModel {
    
    var title: String?
    var backButton: NavigationBarButtonItem?
    var arrayLeftButtons: [NavigationBarButtonItem]?
    var arrayRightButtons: [NavigationBarButtonItem]?
    var titleView: UIView?
    var backgroundImage: UIImage?
    var backGroundColor: UIColor?
    var isTransparent = false
    
    init(title: String? = nil,
         backButton: NavigationBarButtonItem? = nil,
         arrayLeftButtons: [NavigationBarButtonItem]? = nil,
         arrayRightButtons: [NavigationBarButtonItem]? = nil,
         titleView: UIView? = nil,
         backgroundImage: UIImage? = nil,
         backGroundColor: UIColor? = nil,
         isTransparent: Bool = false) {
        
        self.title = title
        self.backButton = backButton
        self.arrayLeftButtons = arrayLeftButtons
        self.arrayRightButtons = arrayRightButtons
        self.titleView = titleView
        self.backgroundImage = backgroundImage
        self.backGroundColor = backGroundColor
        self.isTransparent = isTransparent
    }
}

class NavigationBarButtonItem {
    
    private var icon: UIImage
    var isEnabled = true
    var type: NavigationButtonType
    
    var uiBarButtonItem: UIBarButtonItem?
    var handler: ((NavigationBarButtonItem) -> Void)?
    
    enum NavigationButtonType {
        case logo
        case back
    }
    
    init(type: NavigationButtonType, icon: UIImage, isEnabled: Bool = true) {
        self.type = type
        self.icon = icon
        self.isEnabled = isEnabled
    }
    
    var image: UIImage? {
        return self.icon.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }
    
    @objc func navigationBarButtonItemPressed(sender: UIBarButtonItem) {
        self.handler?(self)
    }
    
    func initUIButtonItem() {
        
        self.uiBarButtonItem = UIBarButtonItem(
            image: self.image,
            style: .plain,
            target: self,
            action: #selector(navigationBarButtonItemPressed(sender:)))
        
        self.uiBarButtonItem?.isEnabled = self.isEnabled
    }
    
    static func transformNavigationItemsToUI(arrayNavigationBarButtonItems: [NavigationBarButtonItem],
                                             handler: @escaping (NavigationBarButtonItem) -> Void) -> [UIBarButtonItem] {
        
        return arrayNavigationBarButtonItems.map { rightButtonItem -> UIBarButtonItem? in
            
            rightButtonItem.handler = handler
            rightButtonItem.initUIButtonItem()
            
            return rightButtonItem.uiBarButtonItem
            
        }.compactMap({ $0 })
    }
    
}

extension NavigationBarButtonItem {
    static var logo = NavigationBarButtonItem(type: .logo, icon: #imageLiteral(resourceName: "ico_correos"))
    static var backArrow = NavigationBarButtonItem(type: .back, icon: #imageLiteral(resourceName: "ico_back_navigation_bar"), isEnabled: true)
}
