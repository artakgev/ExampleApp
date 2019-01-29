//
//  LogoutViewController.swift
//  ExampleApp
//
//  Created by Gevorgyan, Artak on 28/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import Foundation
import UIKit

class LogoutView: UIViewController, LogoutViewViewProtocol {
    
    @IBOutlet weak var logoutButton: UIButton!
    
    var presenter: LogoutViewPresenter!
    
    // MARK: - View life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = LogoutViewPresenterImplementation()
        self.initUIElements()
    }
    
    // MARK: - IBActions
    
    @IBAction func logoutButtonClicked(_ sender: UIButton) {
        presenter.logoutAction()
    }
    
    // MARK: - Protocol methods
    
    func showError(message: String) {
        print("Failed logout")
    }
    
    // MARK: - Private methods
    
    private func initUIElements() {
        self.view.backgroundColor = UIColor.LogoutView.bgColor
        self.logoutButton.setTitleColor(UIColor.LogoutView.logoutButtonTextColor, for: .normal)
        self.logoutButton.titleLabel?.font = UIFont.Common.defaultFont
    }

}

