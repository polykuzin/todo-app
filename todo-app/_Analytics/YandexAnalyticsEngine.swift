//
//  YandexAnalyticsEngine.swift
//  todo-app
//
//  Created by polykuzin on 09/09/2022.
//

import CoreAnalytics
import YandexMobileMetrica

final class YandexAnalyticsEngine {
    
    public init() {
        configure()
    }
    
    public func reportEvent(name: String, metadata: [String: AnyHashable]? = nil) {
        YMMYandexMetrica.reportEvent(name, parameters: metadata) { error in
            print("💔💔💔 Event with name \(name) not sent")
            print("REPORT ERROR: \(error.localizedDescription)")
        }
    }
    
    public func reportError(id: String, message: String, metadata: [String: AnyHashable]? = nil) {
        YMMYandexMetrica.report(error: YMMError(identifier: id, message: message, parameters: metadata)) { error in
            print("💔💔💔 Error with id \(id) not sent")
            print("REPORT ERROR: \(error.localizedDescription)")
        }
    }
}

extension YandexAnalyticsEngine : _AnalyticsEngine {
    
    private var apiKey : String? {
        guard
            let apiKey = Bundle.main.object(forInfoDictionaryKey: "YANDEX_API_KEY") as? String
        else { return nil }
        return apiKey
    }
    
    private func configure() {
        let bundle = Bundle.main
        guard
            let apiKey = apiKey,
            let appVersion = bundle.infoDictionary?["CFBundleShortVersionString"] as? String,
            let yandexMetricsConfiguration = YMMYandexMetricaConfiguration.init(apiKey: apiKey)
        else { fatalError("🤬🤬🤬 No Api Key Found") }
#if !prod
        /// Включает/отключает логирование работы библиотеки.
        yandexMetricsConfiguration.logs = true
#endif
        yandexMetricsConfiguration.appVersion = appVersion
        yandexMetricsConfiguration.crashReporting = true
        
        /// Включает/выключает автоматический сбор и отправку информации о запуске приложения через deeplink.
        yandexMetricsConfiguration.appOpenTrackingEnabled = true
        
        /// Определяет инициализацию AppMetrica как начало сессии.
        /// 'true' — первый запуск определяется как обновление.
        /// 'false' — первый запуск определяется как новая установка.
        yandexMetricsConfiguration.handleFirstActivationAsUpdate = false
        
        /// Определяет инициализацию AppMetrica как начало пользовательской сессии.
        /// 'true' - пользовательская сессия создается в момент инициализации библиотеки
        /// 'false' - в момент инициализации библиотеки создается фоновая сессия, а пользовательская сессия создается после системного события UIApplicationDidBecomeActiveNotification.
        yandexMetricsConfiguration.handleActivationAsSessionStart = false
        
        YMMYandexMetrica.activate(with: yandexMetricsConfiguration)
    }
}
