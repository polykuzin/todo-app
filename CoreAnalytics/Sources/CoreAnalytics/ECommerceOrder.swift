//
//  ECommerceOrder.swift
//  
//
//  Created by polykuzin on 13/09/2022.
//

public protocol _ECommerceOrder {
    
    /// Идентификатор заказа.
    var id : String { get set }
    
    /// Дополнительная информация о заказе
    var metadata : [String: String] { get set }
    
    /// Информацией об источнике перехода.
    var referrer : _ECommerceReferrer { get set }
    
    /// Список товаров в корзине.
    var cartItems : [_ECommerceCartItem] { get set }
}
