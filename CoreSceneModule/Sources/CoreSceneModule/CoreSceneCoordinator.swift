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
    
    
    public init() { }
    
    public var children = [any _Coordinator]()
    
    public func startNavigationFlow() -> some View {
        let view = CoreSplitView()
        return view
    }
}
