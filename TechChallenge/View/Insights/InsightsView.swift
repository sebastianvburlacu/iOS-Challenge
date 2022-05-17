//
//  InsightsView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 29/7/21.
//

import SwiftUI

struct InsightsView: View {
    let transactions: [TransactionModel] = ModelData.sampleTransactions
    @ObservedObject var categoriesTotalSpend: CategoriesModel
    
    var body: some View {
        List {
            RingView(transactions: transactions)
                .scaledToFit()
            
            ForEach(TransactionModel.Category.allCases) { category in
                HStack {
                    Text(category.rawValue)
                        .font(.headline)
                        .foregroundColor(category.color)
                    Spacer()
                    Text("$\(categoriesTotalSpend.getCategoryValue(category: category).formatted())")
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
        InsightsView(categoriesTotalSpend: CategoriesModel())
            .previewLayout(.sizeThatFits)
    }
}
#endif
