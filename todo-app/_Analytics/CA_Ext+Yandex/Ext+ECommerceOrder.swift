//
//  Ext+ECommerceOrder.swift
//  
//
//  Created by polykuzin on 13/09/2022.
//

import CoreAnalytics
import YandexMobileMetrica

extension _ECommerceOrder {
    
    func mapToYandex() -> YMMECommerceOrder {
        return YMMECommerceOrder(
            identifier: id,
            cartItems: cartItems.map({
                $0.mapToYandex()
            }),
            payload: metadata
        )
    }
}
