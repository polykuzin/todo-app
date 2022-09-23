//
//  BaseNavigation.swift
//  
//
//  Created by polykuzin on 23/09/2022.
//

import UIKit

public class BaseNavigation : UINavigationController {
    
    public override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    public override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillDisappear(animated)
    }
}
