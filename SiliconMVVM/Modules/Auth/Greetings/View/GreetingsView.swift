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
            
            FloatingCirclesBackground(count: 8)
            
            VStack(alignment: .leading, spacing: 20) {
                
                Spacer()
                
                Text("Silicon")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundStyle(Color("TextColor"))
                
                Text("Создавай, презентуй, вдохновляй - где бы ты ни был!")
                    .foregroundStyle(Color("TextColor"))
                
                DefaultButton(action: {
                    viewModel.showSignIn()
                }, isFill: true, title: "Войти", leftsideImage: Image(systemName: "person.fill"))
                
                DefaultButton(action: {
                    //
                }, isFill: false, title: "Пропустить", leftsideImage: Image(systemName: "person.badge.shield.exclamationmark"))
                
            }
            .padding(30)
        }
        .hideNavigationBarOnAppear(router: viewModel.router)
    }
}
