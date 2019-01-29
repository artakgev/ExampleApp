//
//  MenuTableViewModel.swift
//  PMP
//
//  Created by Gevorgyan, Artak on 27/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import UIKit

struct MenuTableViewModel {
    
    // MARK: - Properties
    
    let menuCellType: MenuCellType
    
    var text: String {
        switch menuCellType {
        case .home:
            return "All Channels"
        case .subscriptions:
            return "Subscriptions"
        case .settings:
            return "Settings"
        case .about:
            return "About"
        case .disconnectTVBox:
            return "Disconnect TV Box"
        case .logout:
            return "Logout"
        }
    }
    
    var icon: UIImage {
        switch menuCellType {
        case .home:
            return UIImage.MenuItems.homeImage
        case .subscriptions:
            return UIImage.MenuItems.subscriptionsImage
        case .settings:
            return UIImage.MenuItems.settingsImage
        case .about:
            return UIImage.MenuItems.aboutImage
        case .disconnectTVBox:
            return UIImage.MenuItems.disconnectTVBoxImage
        case .logout:
            return UIImage.MenuItems.logoutImage
        }
    }
    
}

extension MenuTableViewModel: MenuItemRepresentable {
    
}
