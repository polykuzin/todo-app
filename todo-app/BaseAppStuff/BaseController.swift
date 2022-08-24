//
//  BaseController.swift
//  todo-app
//
//  Created by polykuzin on 24/08/2022.
//

import UIKit
import SwiftUI

final class BaseController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let splitController = self.splitViewController {
           if let navController = splitController.viewControllers.last as? UINavigationController {
              navController.topViewController?.navigationItem.leftBarButtonItem = splitController.displayModeButtonItem
           }
        }
    }
}

extension BaseController : UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
