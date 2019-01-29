//
//  Theming.swift
//  PMP
//
//  Created by Gevorgyan, Artak on 27/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    public struct Common {
        public static let primaryText = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        public static let menuItemsTint = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        public static let activityIndicatorColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        public static let primaryBGColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        public static let subSectionItem = primaryText
    }
    
    public struct Menu {
        public static let userInfoBackgroundColor = Common.primaryBGColor
        public static let usernameLabelColor = Common.primaryText
        public static let itemText = #colorLiteral(red: 0.8941176471, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        public static let tableViewBGColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
    }
    
    public struct TableView {
        public static let bgColor = Common.primaryBGColor
        public static let cellTitleColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        public static let cellSubTitleColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        public static let cellDateColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    public struct LogoutView {
        public static let bgColor = Common.primaryBGColor
        public static let logoutButtonTextColor = Common.menuItemsTint
    }

}

public extension UIFont {
    struct Common {
        static let defaultFont = UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
}

public extension UIImage {
    
    public struct MenuItems {
        public static let homeImage = UIImage(named: "home").unsafelyUnwrapped
        public static let subscriptionsImage = UIImage(named: "subscriptions").unsafelyUnwrapped
        public static let settingsImage = UIImage(named: "settings").unsafelyUnwrapped
        public static let aboutImage = UIImage(named: "about").unsafelyUnwrapped
        public static let disconnectTVBoxImage = UIImage(named: "disconnectTVBox").unsafelyUnwrapped
        public static let logoutImage = UIImage(named: "logout").unsafelyUnwrapped
    }
    
}



