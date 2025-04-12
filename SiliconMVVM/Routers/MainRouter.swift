//
//  MainRouter.swift
//  SiliconMVVM
//
//  Created by Егорио on 13.04.2025.
//

import UIKit
import SwiftUI

class MainRouter: DefaultRouter {
    
    func startMainFlow() {
        let tabBarController = createTabbarController()
        navigationController?.setViewControllers([tabBarController], animated: true)
        setNavigationBarHidden(true, animated: false)
    }
    
    func createTabbarController() -> UITabBarController {
        let tabbar = UITabBarController()
        
        // Создаем контроллеры для каждого таба
        let createTab = createTabController(
            for: CreateView(),
            title: "Создать",
            imageName: "plus.circle",
            selectedImageName: "plus.circle.fill"
        )
        
        let communityTab = createTabController(
            for: CommunityView(),
            title: "Сообщество",
            imageName: "person.3",
            selectedImageName: "person.3.fill"
        )
        
        let settingsTab = createTabController(
            for: SettingsView(),
            title: "Настройки",
            imageName: "gear",
            selectedImageName: "gear.circle.fill"
        )
        
        // Устанавливаем контроллеры в таббар
        tabbar.viewControllers = [createTab, communityTab, settingsTab]
        
        // Настройка внешнего вида таббара
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        
        return tabbar
    }
    
    // Вспомогательный метод для создания контроллера для таба
    private func createTabController<Content: View>(
        for content: Content,
        title: String,
        imageName: String,
        selectedImageName: String
    ) -> UINavigationController {
        let hostingController = UIHostingController(rootView: content)
        hostingController.title = title
        
        // Настройка иконок для таба
        hostingController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageName),
            selectedImage: UIImage(systemName: selectedImageName)
        )
        
        // Обернем в NavigationController для возможной навигации внутри таба
        let navigationController = UINavigationController(rootViewController: hostingController)
        return navigationController
    }
}
