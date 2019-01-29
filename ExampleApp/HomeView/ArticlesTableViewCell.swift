//
//  ArticlesTableViewCell.swift
//  ExampleApp
//
//  Created by Gevorgyan, Artak on 28/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ArticlesTableViewCell: UITableViewCell {
    
    // MARK: - Type Properties
    
    static let reuseIdentifier = "ArticlesTableViewCell"
    
    // MARK: - Properties
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.textColor = UIColor.TableView.cellTitleColor
        self.dateLabel.textColor = UIColor.TableView.cellDateColor
        self.thumbnailImageView.layer.masksToBounds = true
        self.thumbnailImageView.layer.cornerRadius = 10.0
    }
    
}
