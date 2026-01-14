//
//  meditationApp.swift
//  meditation
//
//  Created by Raymond on 1/14/26.
//

import SwiftUI
import CoreData

@main
struct meditationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
