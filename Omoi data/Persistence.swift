//
//  Persistence.swift
//  Omoi
//
//  Created by Sudharsan Baskaran on 04/11/25.
//

// Persistence.swift
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    /// Default initializer — uses on-disk persistent store
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Omoi") // <- MUST match your .xcdatamodeld name

        if inMemory {
            // keep store in memory (useful for previews / tests)
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                // Replace this with production error handling as appropriate
                fatalError("Unresolved Core Data error \(error), \(error.userInfo)")
            }
        }

        // Helpful defaults
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }

    /// Save changes in the viewContext if any
    func saveContext() {
        let context = container.viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            // Replace with proper error handling in production
            print("Unresolved error saving context: \(nsError), \(nsError.userInfo)")
        }
    }
}


/// MARK: - Preview helper (in-memory store seeded with sample entries)
extension PersistenceController {
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        let viewContext = controller.container.viewContext

        // Create a few sample JournalEntry objects for previewing UI.
        // Make sure attribute names match your Core Data model exactly.
        for i in 0..<4 {
            let newEntry = JournalEntry(context: viewContext)
            newEntry.id = UUID()
            newEntry.date = Calendar.current.date(byAdding: .day, value: -i, to: Date())
            newEntry.emotion = ["Happy", "Sad", "Calm", "Anxious"][i % 4]
            newEntry.note = "This is a preview note #\(i + 1)"
        }

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Failed to save preview context: \(nsError), \(nsError.userInfo)")
        }

        return controller
    }()
}
