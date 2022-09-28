//
//  SceneDelegate.swift
//  todo-app
//
//  Created by polykuzin on 17/08/2022.
//

import Core
import UIKit
import SwiftUI
import CoreAnalytics
import CoreSceneModule
import Module_Tabbar

class SceneDelegate : UIResponder {
    
    public var window : UIWindow?
        
    public var analytics = AnalyticsManager(
        engines: [
            YandexAnalyticsEngine()
        ]
    )
    
    public var coordinator = CoreSceneCoordinator()
    
    @MainActor
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard
            let windowScene = (scene as? UIWindowScene)
        else { return }
        let controller = BaseSplitController()
        controller.viewControllers = [TabbarController(), UIViewController()]
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
    }
}

extension SceneDelegate : UIWindowSceneDelegate { }

extension SceneDelegate : UISplitViewControllerDelegate {

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
