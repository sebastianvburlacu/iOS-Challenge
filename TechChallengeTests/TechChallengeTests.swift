//
//  TechChallengeTests.swift
//  TechChallengeTests
//
//  Created by Adrian Tineo Cabello on 30/7/21.
//

import XCTest
@testable import TechChallenge

class TechChallengeTests: XCTestCase {
    private var categoriesExpenseStore = CategoriesExpenseStore()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTransactionsFiltering() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let transactionsListView = TransactionListView(categoriesExpenseStore: categoriesExpenseStore)
        let travelTransactions = transactionsListView.filterTransactions(transactions: transactionsListView.transactions, byCategory: .travel)
        XCTAssertEqual(travelTransactions.count, 3)
        var sum = 0.0
        travelTransactions.forEach {transaction in
            sum += transaction.amount
        }
        XCTAssertEqual(categoriesExpenseStore.getCategoryValue(category: .travel), sum)
        

        let allTransactions = transactionsListView.filterTransactions(transactions: transactionsListView.transactions, byCategory: .all)
        XCTAssertEqual(allTransactions.count, 13)
        sum = 0.0
        allTransactions.forEach {transaction in
            sum += transaction.amount
        }
        XCTAssertEqual(categoriesExpenseStore.getCategoryValue(category: .all), sum)
    }
    
    func testUpdatingCategoryExpense() throws {
        let initialTravelCosts = categoriesExpenseStore.getCategoryValue(category: .travel)
        categoriesExpenseStore.increaseCategorySpend(category: .travel, value: 50.0)
        XCTAssertEqual(categoriesExpenseStore.getCategoryValue(category: .travel), initialTravelCosts + 50.0)
        // hiding the transaction
        categoriesExpenseStore.decreaseCategorySpend(category: .travel, value: 50.0)
        // need rounding, also done on the UI
        XCTAssertEqual(round(categoriesExpenseStore.getCategoryValue(category: .travel) * 100) / 100, initialTravelCosts)
    }
}
