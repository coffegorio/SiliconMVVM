//
//  PreviewView.swift
//  SiliconMVVM
//
//  Created by Егорио on 09.04.2025.
//

import UIKit
import Lottie

class PreviewView: UIViewController {
    
    var viewModel: PreviewViewModel?
    
    lazy private var lottieView: LottieAnimationView = {
        $0.frame.size = CGSize(width: view.frame.width - 80, height: view.frame.width - 80)
        $0.center = view.center
        $0.loopMode = .loop
        return $0
    }(LottieAnimationView(name: "PreviewAnimation"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        self.view.addSubview(lottieView)
        lottieView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.navigateToGreetings()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Скрываем навигационную панель при появлении экрана
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc private func navigateToGreetings() {
        viewModel?.navigateToGreetings()
    }
}
