//
//  UIEntriesCount.swift
//  CalorieTracker
//
//  Created by Drew Sen on 09/06/2023.
//

import Foundation

struct UIEntriesCount: Identifiable {
    
    enum EntryType: String {
        
        case currentWeek = "Current Week"
        case previousWeek = "Previous Week"
        
    }
    
    let id: UUID
    let type: EntryType
    let date: String
    let entriesCount: Int
    
}
