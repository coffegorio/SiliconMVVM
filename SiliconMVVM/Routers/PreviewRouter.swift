//
//  PreviewRputer.swift
//  SiliconMVVM
//
//  Created by Егорио on 09.04.2025.
//

import UIKit

class PreviewRouter: DefaultRouter {
    
    func start() {
        // тут в будущем я добавлю проверку - если пользователь авторизован, его будет кидать на MainRouter, если нет, на AuthRouter
    }
    
    func showPreview() {
        let previewView = PreviewView()
        let viewModel = PreviewViewModel(router: self)
        previewView.viewModel = viewModel
        navigationController?.pushViewController(previewView, animated: true)
        setNavigationBarHidden(true, animated: false)
    }
}
