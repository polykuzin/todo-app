//
//  ECommerceReferrer.swift
//  
//
//  Created by polykuzin on 12/09/2022.
//

/// Возможные типы источника перехода
/// - **banner**: - банеры сверху и внутри карусели
/// - **button**: - кнопка или ячейка таблицы
/// - **deeplink**: - угадай что?
///
/// AssosiatedValue - названия кнопки / баннера в синтаксисе метрики (<приложение>.<модуль>.<событие>)
public enum _ECommerceReferrerType : String {
    case banner = "banner"
    case button = "button"
    case deeplink = "deeplink"
}

/// Класс с информацией об источнике перехода. Например, о ссылке на страницу или экране, на котором показана карточка товара.
public protocol _ECommerceReferrer {
    
    /// Идентификатор источника перехода. Допустимый размер: до 2048 символов.
    var id : String? { get set }
    
    /// Тип источника перехода — тип объекта, с которого выполняется переход.
    /// Например: «button», «banner», «deeplink». Допустимый размер: до 100 символов.
    var type : _ECommerceReferrerType { get set }
    
    /// Экран источника перехода — экран, с которого выполняется переход.
    var screen : _ECommerceScreen { get set }
}
