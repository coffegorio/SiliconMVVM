//
//  GreetingsView.swift
//  SiliconMVVM
//
//  Created by Егорио on 11.04.2025.
//

import SwiftUI

struct GreetingsView: View {
    
    var viewModel: GreetingsViewModel
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                Text("Это тест вьюхи, лалала тралала траллалеро траллала")
                    .foregroundStyle(Color("TextColor"))
                
                Button {
                    viewModel.showSignIn()
                } label: {
                    Text("Перейти к экрану")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundStyle(Color("BackgroundColor"))
                        .background(Color("TextColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            .padding(30)
        }
        .hideNavigationBarOnAppear(router: viewModel.router)
    }
}
