//
//  EntriesSectionView.swift
//  CalorieTracker
//
//  Created by Drew Sen on 10/06/2023.
//

import SwiftUI

struct EntriesSectionView: View {
    
    @ObservedObject var model: EntriesModel
    
    @State var editEntryIsPresented: Bool = false
    
    var body: some View {
        ForEach(model.filteredSections) { section in
            Section(section.title) {
                DayProgressView(progress: section.progress, limit: section.limit)

                ForEach(section.entries) { entry in
                    EntryView(model: entry)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                Task {
                                    await model.deleteEntry(id: entry.id, imageUrl: entry.imageUrl)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            
                            Button {
                                model.selectedEntry = entry
                                editEntryIsPresented = true
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                        }
                }
            }
            .listStyle(.inset)
            .listRowSeparator(.hidden)
            .buttonStyle(PlainButtonStyle())
            .sheet(
                isPresented: $editEntryIsPresented,
                onDismiss: {
                    editEntryIsPresented = false
                }, content: {
                    EntrySheetView(
                        model: model,
                        isPresented: $editEntryIsPresented
                    )
                    .padding()
                    .presentationDetents([.height(350)])
                    .presentationDragIndicator(.visible)
                    .onDisappear {
                        model.selectedEntry = nil
                    }
                }
            )
        }
    }
    
}
