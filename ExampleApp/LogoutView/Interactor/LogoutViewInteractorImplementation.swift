//
//  LogoutViewInteractorImplementation.swift
//  ExampleApp
//
//  Created by Gevorgyan, Artak on 29/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import Foundation

final class LogoutViewInteractorImplementation: LogoutViewInteractor {
    
    // MARK: - Protocol methods
    
    func performLogout(success: @escaping ((Bool) -> ()), failure: ((String) -> ())?) {
        success(true)
//        failure?("asdf")
    }
}
