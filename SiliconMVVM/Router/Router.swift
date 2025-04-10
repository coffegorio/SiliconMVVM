//
//  AppRouter.swift
//  SiliconMVVM
//
//  Created by Егорио on 09.04.2025.
//

import UIKit
import SwiftUI

protocol BaseRouter: AnyObject {
    var navigationController: UINavigationController? { get set }
    
    func push(_ viewController: UIViewController, animated: Bool)
    func pop(animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool)
    func dismiss(animated: Bool)
    func setNavigationBarHidden(_ hidden: Bool, animated: Bool)
}

class DefaultRouter: BaseRouter {
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func push(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }

    func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }

    func present(_ viewController: UIViewController, animated: Bool) {
        navigationController?.present(viewController, animated: animated)
    }

    func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }
    
    func setNavigationBarHidden(_ hidden: Bool, animated: Bool) {
        navigationController?.setNavigationBarHidden(hidden, animated: animated)
    }
}

class NavBarControllerHost<Content: View>: UIHostingController<Content> {
    var shouldHideNavBar: Bool?
    var parentViewShouldHideNavBar: Bool?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let shouldHide = shouldHideNavBar {
            navigationController?.setNavigationBarHidden(shouldHide, animated: animated)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent {
            if let shouldHide = parentViewShouldHideNavBar {
                navigationController?.setNavigationBarHidden(shouldHide, animated: animated)
            }
        }
    }
}

extension BaseRouter {
    func push<Content: View>(_ swiftUIView: Content, animated: Bool, isNavigationBarHidden: Bool? = nil, title: String? = nil, parentViewShouldHideNavBar: Bool? = true) {
        let hostingController = NavBarControllerHost(rootView: swiftUIView)
        hostingController.title = title
        hostingController.shouldHideNavBar = isNavigationBarHidden
        hostingController.parentViewShouldHideNavBar = parentViewShouldHideNavBar
        
        push(hostingController, animated: animated)
        
        if let isHidden = isNavigationBarHidden {
            setNavigationBarHidden(isHidden, animated: animated)
        }
    }
}

protocol NavigationBarControllable {
    associatedtype RouterType: BaseRouter
    var router: RouterType? { get }
    func ensureNavigationBarHidden(animated: Bool)
    func ensureNavigationBarVisible(animated: Bool)
}

extension NavigationBarControllable {
    func ensureNavigationBarHidden(animated: Bool = false) {
        router?.setNavigationBarHidden(true, animated: animated)
    }
    
    func ensureNavigationBarVisible(animated: Bool = false) {
        router?.setNavigationBarHidden(false, animated: animated)
    }
}

extension View {
    func hideNavigationBarOnAppear<R: BaseRouter>(router: R?) -> some View {
        return self.onAppear {
            router?.setNavigationBarHidden(true, animated: false)
        }
    }
    
    func showNavigationBarOnAppear<R: BaseRouter>(router: R?) -> some View {
        return self.onAppear {
            router?.setNavigationBarHidden(false, animated: false)
        }
    }
}
