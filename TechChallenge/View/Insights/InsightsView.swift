//
//  InsightsView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 29/7/21.
//

import SwiftUI

struct InsightsView: View {
    let transactions: [TransactionModel] = ModelData.sampleTransactions
    @ObservedObject var categoriesExpenseStore: CategoriesExpenseStore
    let nrCategories: Int = TransactionModel.Category.allCases.count
    
    var body: some View {
        List {
            RingView(transactions: transactions, categoriesExpenseStore: categoriesExpenseStore)
                .scaledToFit()
            
            ForEach(TransactionModel.Category.allCases[1..<nrCategories]) { category in
                HStack {
                    Text(category.rawValue)
                        .font(.headline)
                        .foregroundColor(category.color)
                    Spacer()
                    Text("$\(categoriesExpenseStore.getCategoryValue(category: category).formatted())")
                        .bold()
                        .secondary()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Insights")
    }
}

#if DEBUG
struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView(categoriesExpenseStore: CategoriesExpenseStore())
            .previewLayout(.sizeThatFits)
    }
}
#endif
