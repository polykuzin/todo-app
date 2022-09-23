//
//  File.swift
//  
//
//  Created by polykuzin on 23/09/2022.
//

import UIKit
import SwiftUI
import CoreDesign
import Module_Inbox

final public class TabbarController : UITabBarController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarDesign()
        setupTabBarControllers()
        selectedIndex = 1
    }
}

extension TabbarController : UITabBarControllerDelegate {
    
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard
            let split = self.splitViewController,
            let index = self.viewControllers?.firstIndex(where: { $0 == viewController })
        else { return }
        self.tabBar.tintColor = Color.appPrimary.uiColor()
        self.tabBar.barTintColor = .white
        self.tabBar.isTranslucent = true
        switch index {
        case 1:
            let controller = UIViewController()
            controller.view.backgroundColor = .blue
            split.showDetailViewController(controller, sender: nil)
//            self.selectedIndex = 1
            break
            
        case 2:
            let controller = UIViewController()
            controller.view.backgroundColor = .cyan
            break
        default:
            break
        }
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard
            let split = self.splitViewController,
            let index = self.viewControllers?.firstIndex(where: { $0 == viewController })
        else { return false }
        switch index {
        case 0 :
            let controller = UIViewController()
            controller.view.backgroundColor = .blue
            split.showDetailViewController(controller, sender: nil)
            self.selectedIndex = 1
            return false
        default :
            split.viewControllers.remove(at: 1)
            return true
        }
    }
}

extension TabbarController {
    
    private func setupTabBarControllers() {
        let add = Empty_AddTaskController()
        add.view.backgroundColor = .cyan
        add.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(systemName: "plus"),
            selectedImage: UIImage(systemName: "plus")
        )
        let inbox = UIHostingController(rootView: SwiftUIView())
        inbox.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(systemName: "list.bullet"),
            selectedImage: UIImage(systemName: "list.bullet")
        )
        viewControllers = [add, inbox]
    }
    
    private func setupTabBarDesign() {
        self.tabBar.tintColor = .black
        self.tabBar.isTranslucent = true
        self.tabBar.unselectedItemTintColor = .gray
        UITabBarItem.appearance().setTitleTextAttributes(
            [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .bold)
            ],
            for: .normal
        )
        UITabBarItem.appearance().setTitleTextAttributes(
            [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .bold)
            ],
            for: .selected
        )
        
        if #available(iOS 13.0, *) {
            let normalAttrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 10, weight: .regular),.paragraphStyle: NSParagraphStyle.default]
            let selectedAttrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 10, weight: .bold), .paragraphStyle: NSParagraphStyle.default]
            let tabBarApparance = UITabBarAppearance()
            tabBarApparance.configureWithDefaultBackground()
            self.tabBar.standardAppearance = tabBarApparance
            if #available(iOS 15.0, *) {
                tabBarApparance.inlineLayoutAppearance.normal.titleTextAttributes = normalAttrs
                tabBarApparance.inlineLayoutAppearance.selected.titleTextAttributes = selectedAttrs
                tabBarApparance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttrs
                tabBarApparance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttrs
                tabBarApparance.compactInlineLayoutAppearance.normal.titleTextAttributes = normalAttrs
                tabBarApparance.compactInlineLayoutAppearance.selected.titleTextAttributes = selectedAttrs
                
                self.tabBar.scrollEdgeAppearance = tabBarApparance
            }
        }
    }
}
