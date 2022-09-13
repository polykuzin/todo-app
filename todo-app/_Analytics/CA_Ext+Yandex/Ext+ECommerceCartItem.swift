//
//  Ext+ECommerceCartItem.swift
//  
//
//  Created by polykuzin on 13/09/2022.
//

import CoreAnalytics
import YandexMobileMetrica

extension _ECommerceCartItem {
    
    func mapToYandex() -> YMMECommerceCartItem {
        return YMMECommerceCartItem(
            product: product.mapToYandex(),
            quantity: NSDecimalNumber(value: quantity),
            revenue: revenue.mapToYandex(),
            referrer: referrer?.mapToYandex()
        )
    }
}
