//
//  swift_data_demoApp.swift
//  swift-data-demo
//
//  Created by ABALi Mohammed Amine on 04/02/2025.
//

import SwiftUI
import SwiftData

@main
struct swift_data_demoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for : Person.self, isAutosaveEnabled: true)
        }
    }
}
