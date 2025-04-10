//
//  SignInView.swift
//  SiliconMVVM
//
//  Created by Егорио on 11.04.2025.
//

import SwiftUI

struct SignInView: View {
    
    var viewModel: SignInViewModel
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                Text("Тут будет авторизации")
                    .foregroundStyle(Color("TextColor"))
            }
            .padding(30)
        }
    }
}
