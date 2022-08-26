//
//  SceneDelegate.swift
//  todo-app
//
//  Created by polykuzin on 17/08/2022.
//

import UIKit
import SwiftUI

class SceneDelegate : UIResponder {
    
    public var window: UIWindow?
    
    @StateObject
    private var listViewModel = SummaryViewModel()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let controller = BaseSplitController(
            UIHostingController(
                rootView: TabbarView()
                    .environmentObject(listViewModel)
            ),
            UIViewController()
        )
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
    }
}

extension SceneDelegate : UIWindowSceneDelegate { }
