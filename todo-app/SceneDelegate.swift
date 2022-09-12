//
//  SceneDelegate.swift
//  todo-app
//
//  Created by polykuzin on 17/08/2022.
//

import UIKit
import SwiftUI
import CoreAnalytics
import CoreSceneModule

class SceneDelegate : UIResponder {
    
    public var window : UIWindow?
    
    public var coordinator : CoreSceneCoordinator?
    
    @MainActor
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard
            let windowScene = (scene as? UIWindowScene)
        else { return }
        let analytics = AnalyticsManager(
            engines: [
                YandexAnalyticsEngine()
            ]
        )
        let controller = UIHostingController(
            rootView: ContentView()
        )
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
    }
}

extension SceneDelegate : UIWindowSceneDelegate { }
