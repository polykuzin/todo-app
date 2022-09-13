//
//  ECommerceProduct.swift
//  
//
//  Created by polykuzin on 13/09/2022.
//

public protocol _ECommerceProduct {
    
    /// Артикул товара.
    var sku : String { get set }
    
    /// Название товара.
    var name : String { get set }
    
    var metadata : [String: String]? { get set }
    
    /// Фактическая цена товара — цена после применения всех скидок и промокодов.
    var actualPrice : _ECommercePrice { get set }
    
    /// Первоначальная цена товара.
    var originalPrice : _ECommercePrice { get set }
    
    /// Список промокодов, которые применяются к товару.
    var promocodes : [String]? { get set }
    
    /// Путь к товару по категориям.
    var categoryComponents : [String]? { get set }
}
