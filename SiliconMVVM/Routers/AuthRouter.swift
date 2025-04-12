//
//  AuthRouter.swift
//  SiliconMVVM
//
//  Created by Егорио on 11.04.2025.
//

import UIKit
import SwiftUI

class AuthRouter: DefaultRouter {

    func showGreetings() {
        let viewModel = GreetingsViewModel(router: self)
        let greetingsView = GreetingsView(viewModel: viewModel)
        push(greetingsView, animated: true, isNavigationBarHidden: true, enableSwipeBack: true)
    }
    
    func showSignIn() {
        let viewModel = SignInViewModel(router: self)
        let signInView = SignInView(viewModel: viewModel)
        push(signInView, animated: true, isNavigationBarHidden: true, title: "Вход", enableSwipeBack: true)
    }
    
    func showSignUp() {
        let viewModel = LocalSignUpViewModel(router: self)
        let localSignUpView = LocalSignUpView(viewModel: viewModel)
        push(localSignUpView, animated: true, isNavigationBarHidden: true, enableSwipeBack: false)
    }

    func toggleNavigationBar(hidden: Bool, animated: Bool = true) {
        setNavigationBarHidden(hidden, animated: animated)
    }
    
}
