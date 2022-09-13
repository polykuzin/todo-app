//
//  _AnalyticsEngine.swift
//  
//
//  Created by polykuzin on 09/09/2022.
//

public protocol _AnalyticsEngine {
    
    func reportEvent(name: String, metadata: [String: AnyHashable]?)
    
    func reportError(id: String, message: String, metadata: [String: AnyHashable]?)

    func reportRevenue(id: String, price: String, currency: String, quantity: Int)

    func reportECommerce(event: ECommerceEvent)
}

public protocol _AnalyticsError {
    var id : String { get set }
    var message : String { get set }
    var metadata : [String: AnyHashable]? { get set }
}

public protocol _AnalyticsRevenueEvent {
    var id : String { get set }
    var price : String { get set }
    var currency : String { get set }
    var quantity : Int { get set }
}
