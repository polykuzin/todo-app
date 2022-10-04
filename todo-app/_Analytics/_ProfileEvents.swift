//
//  _ProfileEvents.swift
//  todo-app
//
//  Created by polykuzin on 02/10/2022.
//

import UIKit
import CoreAnalytics

internal struct ProfileEvents {
    
    @UserDefault(key: "profile.id", defaultValue: nil)
    private var profileId : String?
    
    @UserDefault(key: "profile.appLaunch", defaultValue: 0)
    private var profileAppLaunch : Double
    
    @UserDefault(key: "profile.firstLaunch", defaultValue: true)
    private var profileFirstLaunch : Bool
    
    private struct AnalyticsEvent : _AnalyticsEvent {
        var name: String
        var metadata: [String : AnyHashable]?
    }
    
    public func reportProfileId() -> (key: ProfileInfo, value: Any) {
        print(#function)
        if let profileId {
            return (key: .id, value: profileId)
        } else {
            let id = UUID().uuidString
            print(self.profileId)
            UserDefaults.standard.set(id, forKey: "profile.id")
            return (key: .id, value: id)
        }
    }
    
    public func reportAppLaunch() -> (key: ProfileInfo, value: Any) {
        print(#function)
        print(profileAppLaunch)
        defer {
            let launch = profileAppLaunch + 1
            UserDefaults.standard.set(launch, forKey: "profile.appLaunch")
        }
        return (key: .appLaunch, value: 1)
    }
    
    public func reportFirstLaunch() -> (key: ProfileInfo, value: Any) {
        print(#function)
        print(profileFirstLaunch)
        defer {
            UserDefaults.standard.set(false, forKey: "profile.firstLaunch")
        }
        return (key: .appLaunch, value: profileFirstLaunch)
    }
}
