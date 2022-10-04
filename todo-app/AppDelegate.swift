//
//  AppDelegate.swift
//  todo-app
//
//  Created by polykuzin on 17/08/2022.
//

import UIKit
import CoreData

@main
class AppDelegate : UIResponder {
    
    private var persistenceController = PersistenceController.shared

}

extension AppDelegate : UIApplicationDelegate {
    
    func applicationWillTerminate(_ application: UIApplication) {
        persistenceController.saveContext()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
