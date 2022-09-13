//
//  ECommerceEvent.swift
//  
//
//  Created by polykuzin on 12/09/2022.
//

/// E-Commerce события: 
/// - **purchaseEventWithOrder**: -  используется для сообщения о завершении покупки.
/// - **addCartItemEventWithItem**: - используется для сообщения  о добавлении товара в корзину.
/// - **showScreenEventWithScreen**: - используется для сообщения  об открытии какой-либо страницы, например: списка товаров, поиска, главной страницы.
/// - **removeCartItemEventWithItem**: - используется для сообщения  об удалении товара из корзины.
/// - **beginCheckoutEventWithOrder**: - используется для сообщения  о начале оформления покупки.
/// - **showProductCardEventWithProduct**: - используется для сообщения о просмотре карточки товара среди других в списке.
/// - **showProductDetailsEventWithProduct**: - используется для сообщения о просмотре страницы товара.
public enum ECommerceEvent {
    case purchaseEventWithOrder(_ECommerceOrder)
    case addCartItemEventWithItem(_ECommerceCartItem)
    case showScreenEventWithScreen(_ECommerceScreen)
    case removeCartItemEventWithItem(_ECommerceCartItem)
    case beginCheckoutEventWithOrder(_ECommerceOrder)
    case showProductCardEventWithProduct(_ECommerceProduct, _ECommerceScreen)
    case showProductDetailsEventWithProduct(_ECommerceProduct, _ECommerceReferrer)
}
