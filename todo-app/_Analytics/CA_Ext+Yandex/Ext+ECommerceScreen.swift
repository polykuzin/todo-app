//
//  Ext+ECommerceScreen.swift
//  
//
//  Created by polykuzin on 13/09/2022.
//

import CoreAnalytics
import YandexMobileMetrica

extension _ECommerceScreen {
    
    func mapToYandex() -> YMMECommerceScreen {
        return YMMECommerceScreen(
            name: name,
            categoryComponents: categoryComponents,
            searchQuery: route,
            payload: metadata
        )
    }
}
