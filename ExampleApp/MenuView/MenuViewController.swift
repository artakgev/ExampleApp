//
//  MenuViewController.swift
//  PMP
//
//  Created by Gevorgyan, Artak on 27/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import Foundation
import UIKit

protocol MenuViewControllerDelegate {
    func open(viewController: UINavigationController)
}


class MenuViewController: UIViewController {
    
    @IBOutlet var userView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var delegate: MenuViewControllerDelegate?
    
    // MARK: - View Life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - View Methods
    
    private func setupView() {
        setupUserInfoView()
        setupTableView()
    }
    
    private func setupUserInfoView() {
        self.userView.backgroundColor = UIColor.Menu.userInfoBackgroundColor
        self.userNameLabel.textColor = UIColor.Menu.usernameLabelColor
    }
    
    private func setupTableView() {
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.backgroundColor = UIColor.Menu.tableViewBGColor
    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuCellType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let menuItemType = MenuCellType.init(rawValue: indexPath.row) else {
            fatalError("Unexpected menu item type")
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? MenuTableViewCell else { fatalError("Unexpected Table View Cell") }
        var viewModel: MenuItemRepresentable?
        viewModel = MenuTableViewModel(menuCellType: menuItemType)
        if let viewModel = viewModel {
            cell.itemLabel.text = viewModel.text
            cell.icon.image = viewModel.icon
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if indexPath.row == 0 {
            let vc = storyboard.instantiateViewController(withIdentifier: "homeViewNavID") as! UINavigationController
            delegate?.open(viewController: vc)
        } else if indexPath.row == 1 {
            let vc = storyboard.instantiateViewController(withIdentifier: "subscriptionsViewNavID") as! UINavigationController
            delegate?.open(viewController: vc)
        } else if indexPath.row == 2 {
            let vc = storyboard.instantiateViewController(withIdentifier: "settingsViewNavID") as! UINavigationController
            delegate?.open(viewController: vc)
        } else if indexPath.row == 3 {
            let vc = storyboard.instantiateViewController(withIdentifier: "aboutViewNavID") as! UINavigationController
            delegate?.open(viewController: vc)
        } else if indexPath.row == 4 {
            let vc = storyboard.instantiateViewController(withIdentifier: "disconnectTVBoxViewNavID") as! UINavigationController
            delegate?.open(viewController: vc)
        } else if indexPath.row == 5 {
            let vc = storyboard.instantiateViewController(withIdentifier: "logoutViewNavID") as! UINavigationController
            delegate?.open(viewController: vc)
        }

    }
    
}
