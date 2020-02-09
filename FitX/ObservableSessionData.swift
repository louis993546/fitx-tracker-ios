//
//  ObservableSessionData.swift
//  FitX
//
//  Created by Louis Tsai on 2/2/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import Foundation
import RealmSwift

// TODO replace SessionData to Session 
final class ObservableSessionData: ObservableObject {
    @Published var sessions: [Session]
    private var channelsToken: NotificationToken?

    // Grab channels from Realm, and then activate a Realm token to listen for changes.
    init() {
        let realm = try! Realm()
        let data = realm.objects(SessionData.self)
            .sorted(byKeyPath: "startTime", ascending: false)
        sessions = data.map { $0.toSession() }
        activateChannelsToken()
    }

    private func activateChannelsToken() {
        let realm = try! Realm()
        let data = realm.objects(SessionData.self)
        channelsToken = data.observe { _ in
            // When there is a change, replace the old channels array with a new one.
            self.sessions = data.map { $0.toSession() }
        }
    }

    deinit {
        channelsToken?.invalidate()
    }
}
