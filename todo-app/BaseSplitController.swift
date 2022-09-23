//
//  BaseSplitController.swift
//  todo-app
//
//  Created by polykuzin on 23/09/2022.
//

import UIKit

open class BaseSplitController : UISplitViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        maximumPrimaryColumnWidth = 412
        preferredPrimaryColumnWidthFraction = 0.4
        preferredDisplayMode = UISplitViewController.DisplayMode.allVisible
    }
}
