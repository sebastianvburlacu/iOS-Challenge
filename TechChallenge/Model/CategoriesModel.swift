//
//  CategoriesModel.swift
//  TechChallenge
//
//  Created by bur on 17/05/2022.
//

import Foundation

class CategoriesModel: ObservableObject {
    @Published var all: Double = 0.0
    @Published var food: Double = 0.0
    @Published var health: Double = 0.0
    @Published var entertainment: Double = 0.0
    @Published var shopping: Double = 0.0
    @Published var travel: Double = 0.0
    
    let transactions: [TransactionModel] = ModelData.sampleTransactions
    
    typealias Category = TransactionModel.Category
    
    init() {
        computeSpendPerCategory()
    }
    
    func increaseCategorySpend(category: Category, value: Double) -> Void {
        switch category {
            case .all:
                all += value
            case .entertainment:
                entertainment += value
            case .food:
                food += value
            case .health:
                health += value
            case .shopping:
                shopping += value
            case .travel:
                travel += value
        }
        all += value
    }
    
    func decreaseCategorySpend(category: Category, value: Double) -> Void {
        switch category {
            case .all:
                all -= value
            case .entertainment:
                entertainment -= value
            case .food:
                food -= value
            case .health:
                health -= value
            case .shopping:
                shopping -= value
            case .travel:
                travel -= value
        }
        all -= value
    }
    
    func getCategoryValue(category: Category) -> Double {
        switch category {
            case .all:
                return all
            case .food:
                return food
            case .health:
                return health
            case .entertainment:
                return entertainment
            case .shopping:
                return shopping
            case .travel:
                return travel
        }
    }
    
    private func computeSpendPerCategory() -> Void {
        transactions.forEach { transaction in
            increaseCategorySpend(category: transaction.category, value: transaction.amount)
        }
    }
}
