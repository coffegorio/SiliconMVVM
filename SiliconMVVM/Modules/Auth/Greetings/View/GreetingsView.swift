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
            
            VStack(spacing: 0) {
                // Для этого экрана нет кнопки назад, но мы добавляем пространство вверху
                Spacer(minLength: 0)
                
                VStack(alignment: .leading, spacing: 20) {
                    // Иконка по центру
                    HStack {
                        Spacer()
                        Image(systemName: "laptopcomputer")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .foregroundStyle(Color("TextColor"))
                        Spacer()
                    }
                    
                    Text("Silicon")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundStyle(Color("TextColor"))
                    
                    Text("Создавай, презентуй, вдохновляй - где бы ты ни был!")
                        .foregroundStyle(Color("TextColor"))
                        .multilineTextAlignment(.leading)
                    
                    DefaultButton(action: {
                        viewModel.showSignIn()
                    }, isFill: true, title: "Войти", leftsideImage: Image(systemName: "person.fill"))
                    
                    DefaultButton(action: {
                        viewModel.showLocalSignUp()
                    }, isFill: false, title: "Продолжить без входа", leftsideImage: Image(systemName: "person.badge.shield.exclamationmark"))
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 50)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
