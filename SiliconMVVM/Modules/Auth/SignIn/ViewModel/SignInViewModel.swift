//
//  SignInViewModel.swift
//  SiliconMVVM
//
//  Created by Егорио on 11.04.2025.
//

import Foundation

class SignInViewModel: NavigationBarControllable {
    
    weak var router: AuthRouter?
    
    init(router: AuthRouter? = nil) {
        self.router = router
    }
    
    func goBack() {
        self.router?.pop(animated: true)
    }
    
}
