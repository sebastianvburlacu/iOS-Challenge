//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    let transactions: [TransactionModel] = ModelData.sampleTransactions
    @State private var selectedCategory = TransactionModel.Category.all
    @State private var totalSpent: Double = 0.0
    
    var body: some View {
        VStack {
            CategoriesHeaderView(selectedCategory: $selectedCategory)
            List {
                ForEach(filterTransactions(transactions: transactions)) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .onAppear {
                computeTotalSpent()
            }
            .onChange(of: selectedCategory) {newVal in
                computeTotalSpent()
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Transactions")
            
            TotalSpentFooterView(selectedCategory: selectedCategory, totalSpent: totalSpent)
        }
    }
    
    private func filterTransactions(transactions: [TransactionModel]) -> [TransactionModel] {
        guard selectedCategory != TransactionModel.Category.all else {return transactions}
        return transactions.filter {transaction in
            transaction.category == selectedCategory
        }
    }
    
    private func computeTotalSpent() -> Void {
        totalSpent = 0
        let filteredTransactions = filterTransactions(transactions: transactions)
        filteredTransactions.forEach {transaction in
            totalSpent += transaction.amount
        }
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
#endif
