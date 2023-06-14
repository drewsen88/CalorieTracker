//
//  DayProgressView.swift
//  CalorieTracker
//
//  Created by Drew Sen on 12/06/2023.
//

import SwiftUI

struct DayProgressView: View {
    
    var progress: Double
    var limit: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Daily Intake:")
                .font(.title3)
                .bold()
                .padding(.top, 5)
            
            ProgressView(value: min(1.0, progress / limit))
                .tint(progress >= limit ? .green : .yellow)
            
            if progress >= limit {
                Text("\(Int(limit)) Reached!")
                    .font(.subheadline)
            } else {
                Text("\(Int(progress)) of \(Int(limit)) Reached!")
                    .font(.subheadline)
            }
        }
    }
    
}
