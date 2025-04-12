//
//  DefaultTextField.swift
//  SiliconMVVM
//
//  Created by Егорио on 12.04.2025.
//

import SwiftUI

struct DefaultTextField: View {
    // Заголовок поля (опционально)
    var title: String = ""
    // Подсказка внутри поля
    var placeholder: String = ""
    // Привязка текста для двустороннего обновления
    @Binding var text: String
    // Стиль клавиатуры (email, number, etc.)
    var keyboardType: UIKeyboardType = .default
    // Показывать ли поле ввода как защищенное (пароль)
    var isSecure: Bool = false
    // Показывать ли кнопку очистки поля
    var showClearButton: Bool = true
    // Включение автокоррекции
    var autocorrection: Bool = false
    // Включение автокапитализации (используем TextInputAutocapitalization вместо UITextAutocapitalizationType)
    var autocapitalization: TextInputAutocapitalization = .never
    // Иконка слева (опционально)
    var leftsideImage: Image? = nil
    
    // Состояния для внутренней логики
    @State private var isEditing: Bool = false
    @State private var isSecureVisible: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Заголовок поля, если есть
            if !title.isEmpty {
                Text(title)
                    .font(.subheadline)
                    .foregroundStyle(Color("TextColor"))
                    .padding(.leading, 4)
            }
            
            // Основное поле ввода
            ZStack {
                // Фон поля
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(isEditing ? Color("PastelPeriwinkle") : Color("TextColor"), lineWidth: 1)
                    )
                    .frame(height: 50)
                
                HStack(spacing: 0) {
                    // Иконка слева (если есть)
                    if let icon = leftsideImage {
                        icon
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 17, height: 17)
                            .foregroundStyle(Color("TextColor"))
                            .padding(.leading, 20)
                            .padding(.trailing, 8)
                    }
                    
                    // Поле ввода (обычное или защищенное)
                    Group {
                        if isSecure && !isSecureVisible {
                            SecureField(placeholder, text: $text)
                                .foregroundStyle(Color("TextColor"))
                                .autocorrectionDisabled(!autocorrection)
                                .textInputAutocapitalization(autocapitalization)
                                .keyboardType(keyboardType)
                        } else {
                            TextField(placeholder, text: $text, onEditingChanged: { editing in
                                withAnimation(.easeIn(duration: 0.1)) {
                                    self.isEditing = editing
                                }
                            })
                            .foregroundStyle(Color("TextColor"))
                            .autocorrectionDisabled(!autocorrection)
                            .textInputAutocapitalization(autocapitalization)
                            .keyboardType(keyboardType)
                        }
                    }
                    .padding(.leading, leftsideImage == nil ? 16 : 0)
                    
                    Spacer()
                    
                    // Кнопки справа (очистка и просмотр пароля)
                    HStack(spacing: 10) {
                        // Кнопка очистки текста
                        if showClearButton && !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(Color("TextColor").opacity(0.6))
                            }
                        }
                        
                        // Кнопка переключения видимости пароля
                        if isSecure {
                            Button(action: {
                                isSecureVisible.toggle()
                            }) {
                                Image(systemName: isSecureVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(Color("TextColor").opacity(0.6))
                            }
                        }
                    }
                    .padding(.trailing, 16)
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        DefaultTextField(
            title: "Email",
            placeholder: "Введите ваш email",
            text: .constant(""),
            keyboardType: .emailAddress,
            leftsideImage: Image(systemName: "envelope.fill")
        )
        
        DefaultTextField(
            title: "Пароль",
            placeholder: "Введите пароль",
            text: .constant("12345"),
            isSecure: true,
            leftsideImage: Image(systemName: "lock.fill")
        )
    }
    .padding()
    .background(Color("BackgroundColor"))
}
