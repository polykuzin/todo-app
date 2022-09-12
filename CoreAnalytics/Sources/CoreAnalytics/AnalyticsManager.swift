//
//  AnalyticsManager.swift
//  
//
//  Created by polykuzin on 09/09/2022.
//

import Foundation

protocol _AnalyticsManager {
    
    init(engines: [_AnalyticsEngine])
}

public class AnalyticsManager : _AnalyticsManager {
    
    required public init(engines: [_AnalyticsEngine]) {
        self.engines = engines
    }
    
    private let engines : [_AnalyticsEngine]

    private func report(_ event: _AnalyticsEvent) {
        engines.forEach {
            $0.reportEvent(name: event.name, metadata: event.metadata)
        }
    }
    
    private func report(_ error: _AnalyticsError) {
        engines.forEach {
            $0.reportError(id: error.id, message: error.message, metadata: error.metadata)
        }
    }
}
