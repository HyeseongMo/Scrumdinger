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
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
        .modelContainer(sharedModelContainer)
    }
}
