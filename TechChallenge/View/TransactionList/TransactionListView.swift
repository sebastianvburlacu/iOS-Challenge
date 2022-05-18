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
    @ObservedObject var categoriesExpenseStore: CategoriesExpenseStore
    
    var body: some View {
        VStack {
            CategoriesHeaderView(selectedCategory: $selectedCategory)
            List {
                ForEach(filterTransactions(transactions: transactions, byCategory: selectedCategory)) { transaction in
                    TransactionView(transaction: transaction,
                                categoriesExpenseStore: categoriesExpenseStore)
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Transactions")
            
            TotalSpentFooterView(selectedCategory: selectedCategory, categorySpend: categoriesExpenseStore.getCategoryValue(category: selectedCategory))
        }
    }
    
    func filterTransactions(transactions: [TransactionModel], byCategory: TransactionModel.Category) -> [TransactionModel] {
        guard byCategory != TransactionModel.Category.all else {return transactions}
        return transactions.filter {transaction in
            transaction.category == byCategory
        }
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(categoriesExpenseStore: CategoriesExpenseStore())
    }
}
#endif
