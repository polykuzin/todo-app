//
//  ECommerceCartItem.swift
//  
//
//  Created by polykuzin on 13/09/2022.
//

/// Информацией о товаре в корзине
public protocol _ECommerceCartItem {
    
    /// Товар
    var product : _ECommerceProduct { get set }
    
    /// Количество товара
    var quantity : Int { get set }
    
    /// Общая цена товара в корзине.
    var revenue : _ECommercePrice { get set }
    
    /// Дополнительная информация о товаре в корзине
    var metadata : [String: String]? { get set }
    
    /// Источника перехода в корзину.
    var referrer : _ECommerceReferrer? { get set }
}
