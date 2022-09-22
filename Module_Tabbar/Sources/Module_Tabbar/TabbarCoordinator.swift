//
//  TabbarCoordinator.swift
//  
//
//  Created by polykuzin on 22/09/2022.
//

import UIKit
import SwiftUI
import CoreCoordinator

public class TabbarCoordinator : _Coordinator {
    
    public var children = [_Coordinator]()
    
    public var navigation : UINavigationController
    
    public init(_ navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    public func startNavigationFlow() {
        let view = TabbarView()
        let controller = UIHostingController(rootView: view)
        navigation.pushViewController(controller, animated: false)
    }
}
