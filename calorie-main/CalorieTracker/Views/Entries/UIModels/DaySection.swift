//
//  DaySection.swift
//  CalorieTracker
//
//  Created by Drew Sen on 11/06/2023.
//

import Foundation

struct UIDaySection: Identifiable {
    
    var id: String
    let day: Date
    let title: String
    let progress: Double
    let limit: Double
    let entries: [UIEntry]
    
}

struct UIEntry: Identifiable {
    
    let id: String
    let title: String
    let kCalValue: Double
    let date: Date
    let imageUrl: URL?
    
}

// MARK: - Mappings

extension Entry {
    
    var asUIEntry: UIEntry {
        UIEntry(
            id: id,
            title: title,
            kCalValue: kCalValue,
            date: date,
            imageUrl: imageUrl
        )
    }
    
}
