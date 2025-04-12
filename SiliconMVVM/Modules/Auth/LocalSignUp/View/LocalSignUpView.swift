//
//  LocalSignUpView.swift
//  SiliconMVVM
//
//  Created by Егорио on 12.04.2025.
//

import SwiftUI

struct LocalSignUpView: View {
    
    var viewModel: LocalSignUpViewModel
    @State private var userName: String = ""
    @State private var showEmptyNameAlert: Bool = false
    
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
                        Image(systemName: "person.badge.plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .foregroundStyle(Color("TextColor"))
                        Spacer()
                    }
                    
                    Text("Как Вас зовут?")
                        .font(.title)
                        .foregroundStyle(Color("TextColor"))
                    
                    Text("Рекомендуем войти в свою учетную запись с помощью Google или Apple, иначе вы не сможете делиться своими работами, а также синхронизировать проекты между устройствами")
                        .padding()
                        .font(.caption)
                        .foregroundStyle(Color("ObsidianBlack"))
                        .multilineTextAlignment(.leading)
                        .background(Color("SoftLavender").clipShape(RoundedRectangle(cornerRadius: 20)))
                    
                    DefaultTextField(
                        title: "Имя пользователя",
                        placeholder: "Введите ваше имя",
                        text: $userName,
                        showClearButton: true,
                        autocapitalization: .words,
                        leftsideImage: Image(systemName: "person.fill")
                    )
                    .padding(.top, 10)
                    
                    DefaultButton(action: {
                        if userName.isEmpty {
                            showEmptyNameAlert = true
                        } else {
                            //
                        }
                    }, isFill: true, title: "Продолжить")
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 50)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .alert("Внимание", isPresented: $showEmptyNameAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Пожалуйста, введите ваше имя, чтобы продолжить.")
        }
    }
}

//#Preview {
//    LocalSignUpView(viewModel: LocalSignUpViewModel(router: AuthRouter(navigationController: UINavigationController())))
//} 
