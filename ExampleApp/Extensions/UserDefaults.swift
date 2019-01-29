//
//  UserDefaults.swift
//  PMP
//
//  Created by Gevorgyan, Artak on 27/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import Foundation

enum MenuCellType: Int {
    case home
    case subscriptions
    case settings
    case about
    case disconnectTVBox
    case logout
    
    static let count: Int = {
        var max = 0
        while let _ = MenuCellType(rawValue: max) { max += 1 }
        return max
    }()
}
