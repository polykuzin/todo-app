//
//  CoreSceneCoordinator.swift
//  
//
//  Created by polykuzin on 09/09/2022.
//

import UIKit
import SwiftUI
import CoreCoordinator

public class CoreSceneCoordinator : _Coordinator {
    
    public var children = [_Coordinator]()
    
    public var navigation : UINavigationController
    
    public init(_ navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    public func startNavigationFlow() {
        let view = CoreSplitView()
        let controller = UIHostingController(rootView: view)
        navigation.pushViewController(controller, animated: false)
    }
}
