//
//  Ext+ECommercePrice.swift
//
//
//  Created by polykuzin on 13/09/2022.
//

import CoreAnalytics
import YandexMobileMetrica

extension _ECommercePrice {
    
    func mapToYandex() -> YMMECommercePrice {
        return .init(
            fiat: fiat.mapToYandex(),
            internalComponents: internalComponents.map({
                return $0.mapToYandex()
            })
        )
    }
}
