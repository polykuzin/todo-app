//
//  BaseSplitController.swift
//  todo-app
//
//  Created by polykuzin on 24/08/2022.
//

import UIKit

@MainActor
final public class BaseSplitController : UISplitViewController {
    
    public init(_ master: UIViewController, _ detail: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [master, detail]
        preferredDisplayMode = .oneBesideSecondary
        maximumPrimaryColumnWidth = 428
        preferredPrimaryColumnWidthFraction = 0.33
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("BaseSplitController required init")
    }
}
