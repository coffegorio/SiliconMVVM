//
//  LocalSignUpViewModel.swift
//  SiliconMVVM
//
//  Created by Егорио on 12.04.2025.
//

import Foundation

class LocalSignUpViewModel: NavigationBarControllable {
    weak var router: AuthRouter?
    
    init(router: AuthRouter? = nil) {
        self.router = router
    }
    
    func goBack() {
        self.router?.pop(animated: true)
    }
}
