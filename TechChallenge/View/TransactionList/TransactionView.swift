//
//  TransactionView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

fileprivate typealias Category = TransactionModel.Category

struct TransactionView: View {
    let transaction: TransactionModel
    @State private var pinImageName: String = "pin.fill"
    @State private var pinnedTransaction = true
    @ObservedObject var categoriesTotalSpend: CategoriesModel
    
    var body: some View {
        VStack {
            HStack {
                Text(transaction.category.rawValue)
                    .font(.headline)
                    .foregroundColor(transaction.category.color)
                Spacer()
                Button(action: {
                    pinImageName = (pinImageName == "pin.fill") ? "pin.slash.fill" : "pin.fill"
                    pinnedTransaction.toggle()
                    transaction.ignoreAmount.toggle()
                    if (pinnedTransaction) {
                        categoriesTotalSpend.increaseCategorySpend(category: transaction.category, value: transaction.amount)
                    } else {
                        categoriesTotalSpend.decreaseCategorySpend(category: transaction.category, value: transaction.amount)
                    }
                }) {
                    Image(systemName: pinImageName)
                }
            }
            
            if (pinnedTransaction) {
                HStack {
                    transaction.image
                        .resizable()
                        .frame(
                            width: 60.0,
                            height: 60.0,
                            alignment: .top
                        )
                    
                    VStack(alignment: .leading) {
                        Text(transaction.name)
                            .secondary()
                        Text(transaction.accountName)
                            .tertiary()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("$\(transaction.amount.formatted())")
                            .bold()
                            .secondary()
                        Text(transaction.date.formatted)
                            .tertiary()
                    }
                }
            }
        }
        .padding(8.0)
        .background(Color.accentColor.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
    }
}

#if DEBUG
struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TransactionView(transaction: ModelData.sampleTransactions[0], categoriesTotalSpend: CategoriesModel())
            TransactionView(transaction: ModelData.sampleTransactions[1], categoriesTotalSpend: CategoriesModel())
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif
