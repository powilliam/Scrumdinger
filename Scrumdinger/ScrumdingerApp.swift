//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by William Porto on 30/05/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.data)
        }
    }
}
