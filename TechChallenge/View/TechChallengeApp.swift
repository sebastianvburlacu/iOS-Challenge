//
//  TechChallengeApp.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

@main
struct TechChallengeApp: App {
    @StateObject var categoriesExpenseStore = CategoriesExpenseStore()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    TransactionListView(categoriesExpenseStore: categoriesExpenseStore)
                }
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
                }
                
                NavigationView {
                    InsightsView(categoriesExpenseStore: categoriesExpenseStore)
                }
                .tabItem {
                    Label("Insights", systemImage: "chart.pie.fill")
                }
            }
        }
    }
}
