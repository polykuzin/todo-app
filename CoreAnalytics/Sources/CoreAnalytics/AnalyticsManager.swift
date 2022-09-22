//
//  AnalyticsManager.swift
//  
//
//  Created by polykuzin on 09/09/2022.
//

protocol _AnalyticsManager {
    
    init(engines: [_AnalyticsEngine])
    
    func report(_ event: _AnalyticsEvent)
    
    func report(_ error: _AnalyticsError)
    
    func report(_ revenue: _AnalyticsRevenueEvent)
    
    func report(_ ecommerce: ECommerceEvent)
}

public class AnalyticsManager : _AnalyticsManager {
    
    required public init(engines: [_AnalyticsEngine]) {
        self.engines = engines
    }
    
    internal func report(_ event: _AnalyticsEvent) {
        engines.forEach {
            $0.reportEvent(name: event.name, metadata: event.metadata)
        }
    }
    
    internal func report(_ error: _AnalyticsError) {
        engines.forEach {
            $0.reportError(id: error.id, message: error.message, metadata: error.metadata)
        }
    }
    
    internal func report(_ revenue: _AnalyticsRevenueEvent) {
        engines.forEach {
            $0.reportRevenue(id: revenue.id, price: revenue.price, currency: revenue.currency, quantity: revenue.quantity)
        }
    }
    
    internal func report(_ ecommerce: ECommerceEvent) {
        engines.forEach {
            $0.reportECommerce(event: ecommerce)
        }
    }
    
    private let engines : [_AnalyticsEngine]
}
