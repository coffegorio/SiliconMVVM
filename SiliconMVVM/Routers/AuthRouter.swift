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
        push(greetingsView, animated: true, isNavigationBarHidden: true)
    }
    
    func showSignIn() {
        let viewModel = SignInViewModel(router: self)
        let signInView = SignInView(viewModel: viewModel)
        push(signInView, animated: true, isNavigationBarHidden: false, title: "Вход", parentViewShouldHideNavBar: true)
    }
    
    func showSignUp() {
//        let viewModel = SignUpViewModel(router: self)
//        let signUpView = SignUpView(viewModel: viewModel)
//        push(signUpView, animated: true, isNavigationBarHidden: false, title: "Регистрация")
    }

    func toggleNavigationBar(hidden: Bool, animated: Bool = true) {
        setNavigationBarHidden(hidden, animated: animated)
    }
    
}
