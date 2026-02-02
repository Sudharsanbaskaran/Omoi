//
//  OmoiApp.swift
//  Omoi
//
//  Created by Sudharsan Baskaran on 04/11/25.
//

import SwiftUI
import CoreData

@main
struct OmoiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
