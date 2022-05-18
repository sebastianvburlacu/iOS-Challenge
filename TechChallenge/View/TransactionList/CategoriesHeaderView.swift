//
//  CategoriesHeaderView.swift
//  TechChallenge
//
//  Created by bur on 16/05/2022.
//

import SwiftUI

struct CategoriesHeaderView: View {
    @Binding var selectedCategory: TransactionModel.Category
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(TransactionModel.Category.allCases) {category in
                    Button(action: {
                        selectedCategory = category
                    }, label: {
                        Text(category.id)
                            .font(.title2).fontWeight(.bold)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(category.color)
                            .cornerRadius(20)
                    })
                }
            }
            .padding()
        }
        .background(Color.accentColor.opacity(0.8))
        .foregroundColor(.white)
    }
}

struct CategoriesHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesHeaderView(selectedCategory: .constant(TransactionModel.Category.all))
            .previewLayout(.sizeThatFits)
    }
}
