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
        
    public var analytics = AnalyticsManager(
        engines: [
            YandexAnalyticsEngine()
        ]
    )
    
    let persistenceController = PersistenceController.shared
    
    @MainActor
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard
            let scene = (scene as? UIWindowScene)
        else { return }
        window = UIWindow(windowScene: scene)
        let controller = UIHostingController(
            rootView: TabbarView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        )
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate : UIWindowSceneDelegate { }

extension SceneDelegate : UISplitViewControllerDelegate {

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
