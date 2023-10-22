//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Paul Mo on 2023/10/12.
//

import SwiftUI
import SwiftData

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
