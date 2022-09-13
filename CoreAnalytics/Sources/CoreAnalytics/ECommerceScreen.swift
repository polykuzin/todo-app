//
//  ECommerceScreen.swift
//  
//
//  Created by polykuzin on 12/09/2022.
//

/// Информацией об экране.
public protocol _ECommerceScreen {
    
    /// Имя экрана, на котором происходит событие
    var name : String { get set }
    
    /// Поисковый запрос. Допустимый размер: до 1000 символов.
    var route : String? { get set }
    
    /// Дополнительная информация об экране. (пока не используется
    var metadata : [String: String] { get set }
    
    /// Путь к экрану по категориям. Допустимые размеры:
    /// - до 10 элементов;
    /// - размер одного элемента до 100 символов.
    var categoryComponents : [String]? { get set }
}
