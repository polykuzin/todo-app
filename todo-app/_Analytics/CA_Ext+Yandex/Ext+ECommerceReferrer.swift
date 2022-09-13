//
//  Ext+ECommerceReferrer.swift
//  
//
//  Created by polykuzin on 13/09/2022.
//

import CoreAnalytics
import YandexMobileMetrica

extension _ECommerceReferrer {
    
    func mapToYandex() -> YMMECommerceReferrer {
        return YMMECommerceReferrer(
            type: type.rawValue,
            identifier: id,
            screen: screen.mapToYandex()
        )
    }
}
