//
//  MenuTableViewCell.swift
//  PMP
//
//  Created by Gevorgyan, Artak on 27/01/2019
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import Foundation
import UIKit

class MenuTableViewCell: UITableViewCell {
    
    // MARK: - Type Properties
    
    static let reuseIdentifier = "MenuTableViewCell"
    
    // MARK: - Properties
    
    @IBOutlet var icon: UIImageView!
    @IBOutlet var itemLabel: UILabel!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Configure Cell
        icon.tintColor = UIColor.Common.menuItemsTint
    }
    
    override func select(_ sender: Any?) {
        
    }
    
}

