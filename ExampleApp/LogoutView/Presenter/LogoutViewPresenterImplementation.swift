//
//  LogoutViewPresenterImplementation.swift
//  ExampleApp
//
//  Created by Gevorgyan, Artak on 29/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import Foundation

final class LogoutViewPresenterImplementation: LogoutViewPresenter {
    
    var interactor: LogoutViewInteractor!
    var router: LogoutViewRouter!
    var view: LogoutView!
    
    init() {
        self.interactor = LogoutViewInteractorImplementation()
        self.router = LogoutViewRouterImplementation()
        self.view = LogoutView()
    }

    // MARK: - Protocol methods
    
    func logoutAction() {
        interactor.performLogout(success: { (isSuccess) in
            print("Logout response")
            self.router.goToSignInScreen()
        }) { (failure) in
            self.view.showError(message: failure)
        }
    }    

    func cancelAction() {
    }
}
