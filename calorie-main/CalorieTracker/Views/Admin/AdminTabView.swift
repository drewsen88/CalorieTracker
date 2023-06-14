//
//  AdminTabView.swift
//  CalorieTracker
//
//  Created by Drew Sen on 10/06/2023.
//

import SwiftUI

struct AdminTabView: View {
    
    @EnvironmentObject var appRepo: ApplicationRepository
    @ObservedObject var model: AdminModel
    
    @State var selectedTab: Tab = .usersList
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                UsersListView(model: model)
                    .environmentObject(appRepo)
            }
            .tag(Tab.usersList)
            .tabItem {
                Text("Users")
                Image(systemName: "person.3")
            }
            
            NavigationStack {
                ReportsView(model: model)
                    .environmentObject(appRepo)
            }
            .tag(Tab.reports)
            .tabItem {
                Text("Reports")
                Image(systemName: "chart.bar")
            }
        }
    }
    
}

extension AdminTabView {
    
    enum Tab: Hashable {
        
        case usersList
        case reports
        
    }
    
}
