//
//  CoreCoordinator.swift
//  
//
//  Created by polykuzin on 12/09/2022.
//

import UIKit

public protocol _Coordinator {
    
    var children : [_Coordinator] { get set }
    
    var navigation : UINavigationController { get set }
    
    func startNavigationFlow() 
}
