//
//  M_AnalyticsEvents.swift
//  Bus
//
//  Created by polykuzin on 14/09/2022.
//

import CoreAnalytics

struct M_Events {
    
    struct AnalyticsEvent : _AnalyticsEvent {
        var name : String
        var metadata : [String: AnyHashable]?
    }
    
    func makeChangeCardEvent() -> _AnalyticsEvent {
        return AnalyticsEvent(name: "newmetro.cabinet.maas.tap.changeCard")
    }
    
    // переходим на новый нейминг в модулях,
    // не пугайся - их будем для воронок юзать
    func makeNewNamingCardEvent() -> _AnalyticsEvent {
        return AnalyticsEvent(name: "mm.maas.changeCard")
    }
    
    func makeHowWorkEvent() -> _AnalyticsEvent {
        return AnalyticsEvent(name: "newmetro.cabinet.maas.tap.howWork")
    }
    
    // переходим на новый нейминг в модулях,
    // не пугайся - их будем для воронок юзать
    func makeNewNameHowWorkEvent() -> _AnalyticsEvent {
        return AnalyticsEvent(name: "mm.maas.howWork")
    }
    
    func makePassHistoryEvent() -> _AnalyticsEvent {
        return AnalyticsEvent(name: "newmetro.cabinet.maas.tap.passHistory")
    }
    
    // переходим на новый нейминг в модулях,
    // не пугайся - их будем для воронок юзать
    func makeNewNamePassHistoryEvent() -> _AnalyticsEvent {
        return AnalyticsEvent(name: "mm.maas.passHistory")
    }
    
    func makeNotificationsEvent() -> _AnalyticsEvent {
        return AnalyticsEvent(name: "newmetro.cabinet.maas.tap.notifications")
    }
    
    // переходим на новый нейминг в модулях,
    // не пугайся - их будем для воронок юзать
    func makeNewNameNotificationsEvent() -> _AnalyticsEvent {
        return AnalyticsEvent(name: "mm.maas.notifications")
    }
    
    func makeLinkCardEvent() -> _AnalyticsEvent {
        return AnalyticsEvent(name: "newmetro.cabinet.maas.tap.linkCard")
    }
    
    // переходим на новый нейминг в модулях,
    // не пугайся - их будем для воронок юзать
    func makeNewNameLinkCardEvent() -> _AnalyticsEvent {
        return AnalyticsEvent(name: "mm.maas.linkCard")
    }
    
    func makeChangeCardTappedEvent() -> _AnalyticsEvent {
        return AnalyticsEvent(name: "newmetro.cabinet.maas.changeCard.tap.change")
    }
    
    // переходим на новый нейминг в модулях,
    // не пугайся - их будем для воронок юзать
    func makeNewNameChangeCardTappedEvent() -> _AnalyticsEvent {
        return AnalyticsEvent(name: "mm.maas.changeCardTapped")
    }
    
    func makeBuySubscriptionEvent(_ data: M_Subscription) {
        return AnalyticsEvent(
            name: "newmetro.cabinet.maas.tap.buySub",
            metadata: [
                "id": data.id
                "sum": data.price / 100
            ]
        )
    }
    
    func makeNewNameуBuySubscriptionEvent(_ data: M_Subscription) {
        return AnalyticsEvent(
            name: "mm.maas.buySubscription",
            metadata: [
                "id": data.id
                "sum": data.price / 100,
                "name": data.name
            ]
        )
    }
    
    func makeNotificationTappedEvent(_ data: M_Subscription) {
        return AnalyticsEvent(name: "newmetro.cabinet.maas.notifications.tap.notification")
    }
}
