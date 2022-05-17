//
//  TotalSpentFooterView.swift
//  TechChallenge
//
//  Created by bur on 17/05/2022.
//

import SwiftUI

struct TotalSpentFooterView: View {
    let selectedCategory: TransactionModel.Category
    let totalSpent: Double
    
    var body: some View {
        VStack {
            Text("\(selectedCategory.rawValue)")
                .font(.headline)
                .foregroundColor(selectedCategory.color)
                .frame(maxWidth: .infinity, alignment: .trailing)

            HStack {
                Text("Total spent:")
                    .secondary()
                Spacer()
                Text("$\(totalSpent.formatted())")
                    .fontWeight(.bold)
                    .secondary()
            }
        }
        .padding(.horizontal, 35)
        .padding(.vertical, 10)
        .overlay(
                RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 2)
                    .padding(.horizontal, 17)
        )
    }
}

struct TotalSpentFooterView_Previews: PreviewProvider {
    static var previews: some View {
        TotalSpentFooterView(selectedCategory: TransactionModel.Category.all, totalSpent: 20.0)
            .previewLayout(.sizeThatFits)
    }
}
