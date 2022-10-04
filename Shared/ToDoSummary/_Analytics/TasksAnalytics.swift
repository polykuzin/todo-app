//
//  TasksAnalytics.swift
//  todo-app
//
//  Created by polykuzin on 02/10/2022.
//

import CoreAnalytics

internal struct TasksAnalytics {
    
    private struct AnalyticsEvent : _AnalyticsEvent {
        var name: String
        var metadata: [String : AnyHashable]?
    }
    
    public func reportTaskAdd() -> _AnalyticsEvent {
        print(#function)
        return AnalyticsEvent(
            name: "task.add"
        )
    }
    
    public func reportTaskDelete() -> _AnalyticsEvent {
        print(#function)
        return AnalyticsEvent(
            name: "task.delete"
        )
    }
    
    public func reportTaskComplete() -> _AnalyticsEvent {
        print(#function)
        return AnalyticsEvent(
            name: "task.complete"
        )
    }
    
    public func reportTaskReComplete() -> _AnalyticsEvent {
        print(#function)
        return AnalyticsEvent(
            name: "task.recomplete"
        )
    }
}
