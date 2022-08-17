//
//  SceneDelegate.swift
//  todo-app
//
//  Created by polykuzin on 17/08/2022.
//

import UIKit

class SceneDelegate : UIResponder {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

extension SceneDelegate : UIWindowSceneDelegate { }
