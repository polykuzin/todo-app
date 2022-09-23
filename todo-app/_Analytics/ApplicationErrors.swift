//
//  ApplicationErrors.swift
//  todo-app
//
//  Created by polykuzin on 22/09/2022.
//

import CoreAnalytics

internal struct ApplicationErrors {
    
    private struct AnalyticsError : _AnalyticsError {
        var id: String
        var message: String
        var metadata: [String : AnyHashable]?
    }
}
