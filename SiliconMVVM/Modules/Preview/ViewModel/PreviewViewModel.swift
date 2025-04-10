//
//  PreviewViewModel.swift
//  SiliconMVVM
//
//  Created by Егорио on 09.04.2025.
//

import Foundation
import UIKit

class PreviewViewModel {
    
    private weak var router: PreviewRouter?
    private var authRouter: AuthRouter?
    
    init(router: PreviewRouter? = nil) {
        self.router = router
    }
    
    func navigateToGreetings() {
        guard let navigationController = router?.navigationController else { return }
        authRouter = AuthRouter(navigationController: navigationController)
        authRouter?.showGreetings()
    }
    
}
