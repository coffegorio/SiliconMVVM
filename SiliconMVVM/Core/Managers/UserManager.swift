//
//  UserManager.swift
//  SiliconMVVM
//
//  Created by Егорио on 13.04.2025.
//

import Foundation

/// Класс для управления информацией о пользователе (сохранение/загрузка/удаление)
class UserManager {
    // MARK: - Синглтон
    
    /// Синглтон для доступа к менеджеру
    static let shared = UserManager()
    
    /// Приватный инициализатор для синглтона
    private init() {}
    
    // MARK: - Константы
    
    /// Константы для ключей в UserDefaults
    private enum UserDefaultsKeys {
        static let userName = "user_name"
        static let userLoggedIn = "user_logged_in"
    }
    
    // MARK: - Публичные свойства
    
    /// Имя пользователя, если оно сохранено
    var userName: String? {
        get {
            return UserDefaults.standard.string(forKey: UserDefaultsKeys.userName)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.userName)
        }
    }
    
    /// Флаг, показывающий, авторизован ли пользователь через соцсети
    var isLoggedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDefaultsKeys.userLoggedIn)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.userLoggedIn)
        }
    }
    
    // MARK: - Функции для работы с данными пользователя
    
    /// Сохраняет имя пользователя
    /// - Parameter name: Имя для сохранения
    func saveUserName(_ name: String) {
        userName = name
    }
    
    /// Удаляет имя пользователя
    func deleteUserName() {
        userName = nil
    }
    
    /// Отмечает, что пользователь авторизовался через соцсети
    func markUserAsLoggedIn() {
        isLoggedIn = true
    }
    
    /// Выполняет выход пользователя из соцсетей
    func logoutUser() {
        isLoggedIn = false
    }
    
    /// Полностью сбрасывает данные пользователя (и имя, и авторизацию)
    func resetUserData() {
        deleteUserName()
        isLoggedIn = false
    }
    
    /// Проверяет, есть ли у пользователя имя
    /// - Returns: true, если имя задано
    func hasUserName() -> Bool {
        return userName != nil && !(userName?.isEmpty ?? true)
    }
} 
