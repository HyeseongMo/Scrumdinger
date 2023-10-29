//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Paul Mo on 2023/10/29.
//

import SwiftUI

class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .deletingLastPathComponent("scrums.data")
    }
}
