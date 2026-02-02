//
//  AddEntryView.swift
//  Omoi
//
//  Created by Sudharsan Baskaran on 10/11/25.
//

import SwiftUI
import CoreData

struct AddEntryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var emotion: String = ""
    @State private var note: String = ""

    var body: some View {
        Form {
            Section("Emotion") {
                TextField("How are you feeling?", text: $emotion)
            }

            Section("Note") {
                TextEditor(text: $note)
                    .frame(height: 150)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3)))
            }

            Section {
                Button("Save Entry") {
                    addEntry()
                    dismiss()
                }
                .disabled(emotion.isEmpty)
            }
        }
        .navigationTitle("New Entry")
    }

    private func addEntry() {
        let newEntry = JournalEntry(context: viewContext)
        newEntry.id = UUID()
        newEntry.date = Date()
        newEntry.emotion = emotion
        newEntry.note = note

        do {
            try viewContext.save()
        } catch {
            print("Error saving entry: \(error.localizedDescription)")
        }
    }
}
#Preview {
    NavigationStack {
        AddEntryView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
