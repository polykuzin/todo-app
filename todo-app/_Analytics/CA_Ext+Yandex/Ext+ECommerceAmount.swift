//
//  Ext+ECommerceAmount.swift
//  
//
//  Created by polykuzin on 13/09/2022.
//

import CoreAnalytics
import YandexMobileMetrica

extension _ECommerceAmount {
    
    func mapToYandex() -> YMMECommerceAmount {
        return YMMECommerceAmount(
            unit: unit,
            value: NSDecimalNumber(value: value)
        )
    }
}
