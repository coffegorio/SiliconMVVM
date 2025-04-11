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
            
            FloatingCirclesBackground(count: 8)
            
            VStack(alignment: .leading, spacing: 20) {
                
                ArrowBack {
                    viewModel.goBack()
                }
                
                Spacer()
                
                Text("Войдите в свою учетную запись, чтобы продолжить!")
                    .font(.title2)
                    .foregroundStyle(Color("TextColor"))
                
                DefaultButton(action: {
                    //
                }, isFill: true, title: "Войти с помощью Google")
                
                DefaultButton(action: {
                    //
                }, isFill: true, title: "Войи с помощью Apple")
                
            }
            .padding(30)
        }
    }
}
