//
//  GreetingsViewModel.swift
//  SiliconMVVM
//
//  Created by Егорио on 11.04.2025.
//

import Foundation

class GreetingsViewModel: NavigationBarControllable {
    
    weak var router: AuthRouter?
    
    init(router: AuthRouter? = nil) {
        self.router = router
    }
    
    func showSignIn() {
        self.router?.showSignIn()
    }
}
