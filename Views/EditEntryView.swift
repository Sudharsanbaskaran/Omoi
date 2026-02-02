//
//  EditEntryView.swift
//  Omoi
//
//  Created by Sudharsan Baskaran on 10/11/25.
//

import SwiftUI
import CoreData

struct EditEntryView: View {
    @Environment(\.managedObjectContext) private var viewContext

    // Fetch all JournalEntry items sorted by date (newest first)
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \JournalEntry.date, ascending: false)],
        animation: .default)
    private var entries: FetchedResults<JournalEntry>

    var body: some View {
        NavigationStack {
            Group {
                if entries.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "book.closed")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        Text("No entries yet")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text("Tap + to add your first emotion journal.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(entries) { entry in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(entry.emotion ?? "No Emotion")
                                    .font(.headline)
                                if let note = entry.note, !note.isEmpty {
                                    Text(note)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                if let date = entry.date {
                                    Text(date, style: .date)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
            }
            .navigationTitle("Omoi Journal")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: AddEntryView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    // Delete selected entries
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { entries[$0] }.forEach(viewContext.delete)
            try? viewContext.save()
        }
    }
}
#Preview {
    EditEntryView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
