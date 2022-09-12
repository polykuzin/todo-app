//
//  _AnalyticsEngine.swift
//  
//
//  Created by polykuzin on 09/09/2022.
//

import Foundation

public protocol _AnalyticsEngine {
    
    func reportEvent(name: String, metadata: [String: AnyHashable]?)
    
    func reportError(id: String, message: String, metadata: [String: AnyHashable]?)
}

public protocol _AnalyticsEvent {
    var name : String { get set }
    var metadata : [String: AnyHashable]? { get set }
}

public protocol _AnalyticsError {
    var id : String { get set }
    var message : String { get set }
    var metadata : [String: AnyHashable]? { get set }
}
