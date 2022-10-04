//
//  SceneDelegate.swift
//  todo-app
//
//  Created by polykuzin on 17/08/2022.
//

import UIKit
import SwiftUI
import CoreAnalytics

class SceneDelegate : UIResponder {
    
    public var window : UIWindow?
    
    private var profileEvents = ProfileEvents()
    
    private var analyticsEvents = ApplicationEvents()
        
    private var analyticsManager = AnalyticsManager(
        engines: [
            YandexAnalyticsEngine()
        ]
    )
    
    private let persistenceController = PersistenceController.shared
}

extension SceneDelegate : UIWindowSceneDelegate {
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        analyticsManager.report(profileEvents.reportProfileId())
        analyticsManager.report(profileEvents.reportAppLaunch())
        analyticsManager.report(profileEvents.reportFirstLaunch())
        analyticsManager.report(analyticsEvents.reportAppLaunch())
    }
    
    @MainActor
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard
            let scene = (scene as? UIWindowScene)
        else { return }
        window = UIWindow(windowScene: scene)
        let controller = UIHostingController(
            rootView: TabbarView()
                .environmentObject(analyticsManager)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        )
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
