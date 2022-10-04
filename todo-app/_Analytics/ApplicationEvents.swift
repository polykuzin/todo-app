//
//  ApplicationEvents.swift
//  todo-app
//
//  Created by polykuzin on 22/09/2022.
//

import CoreAnalytics

internal struct ApplicationEvents {
    
    private struct AnalyticsEvent : _AnalyticsEvent {
        var name: String
        var metadata: [String : AnyHashable]?
    }
    
    public func reportAppLaunch() -> _AnalyticsEvent {
        print(#function)
        return AnalyticsEvent(
            name: "appLaunch"
        )
    }
}
