//
//  TechChallengeApp.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

@main
struct TechChallengeApp: App {
    @StateObject var categoriesTotalSpend = CategoriesModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    TransactionListView(categoriesTotalSpend: categoriesTotalSpend)
                }
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
                }
                
                NavigationView {
                    InsightsView(categoriesTotalSpend: categoriesTotalSpend)
                }
                .tabItem {
                    Label("Insights", systemImage: "chart.pie.fill")
                }
            }
        }
    }
}
