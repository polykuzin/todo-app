//
//  ECommercePrice.swift
//  
//
//  Created by polykuzin on 13/09/2022.
//

public protocol _ECommercePrice {
    
    /// Стоимость в фиатных деньгах.
    var fiat : _ECommerceAmount { get set }
    
    /// Стоимость внутренних компонентов — суммы во внутренней валюте.
    var internalComponents : [_ECommerceAmount] { get set }
}

public protocol _ECommerceAmount {
    
    /// Единица измерения. Например: USD, RUB.
    var unit : String { get set }
    
    /// Количество
    var value : Double { get set }
}
