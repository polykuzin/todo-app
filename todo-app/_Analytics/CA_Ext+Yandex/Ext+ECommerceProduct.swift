//
//  Ext+ECommerceProduct.swift
//  
//
//  Created by polykuzin on 13/09/2022.
//

import CoreAnalytics
import YandexMobileMetrica

extension _ECommerceProduct {
    
    func mapToYandex() -> YMMECommerceProduct {
        return YMMECommerceProduct(
            sku: sku,
            name: name,
            categoryComponents: categoryComponents,
            payload: metadata,
            actualPrice: actualPrice.mapToYandex(),
            originalPrice: originalPrice.mapToYandex(),
            promoCodes: promocodes
        )
    }
}
