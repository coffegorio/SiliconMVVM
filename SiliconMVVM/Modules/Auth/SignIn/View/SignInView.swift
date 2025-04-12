//
//  SignInView.swift
//  SiliconMVVM
//
//  Created by Егорио on 11.04.2025.
//

import SwiftUI

struct SignInView: View {
    
    var viewModel: SignInViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
        
            VStack(spacing: 0) {
                HStack {
                    ArrowBack {
                        viewModel.goBack()
                    }
                    Spacer()
                }
                .padding(.top, 15)
                .padding(.leading, 16)
                
                Spacer(minLength: 0)
                
                VStack(alignment: .leading, spacing: 30) {
                    HStack {
                        Spacer()
                        Image(systemName: "key.horizontal.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .foregroundStyle(Color("TextColor"))
                        Spacer()
                    }
                    
                    Text("Войдите в свою учетную запись, чтобы продолжить!")
                        .font(.title2)
                        .foregroundStyle(Color("TextColor"))
                        .multilineTextAlignment(.leading)
                    
                    VStack(spacing: 16) {
                        DefaultButton(action: {
                            //
                        }, isFill: true, title: "Войти с помощью Google")
                        
                        DefaultButton(action: {
                            //
                        }, isFill: true, title: "Войи с помощью Apple")
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 50)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
