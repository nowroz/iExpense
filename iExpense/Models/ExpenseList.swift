//
//  ExpenseList.swift
//  iExpense
//
//  Created by Nowroz Islam on 17/8/23.
//

import SwiftUI

@Observable final class ExpenseList {
    var expenses: [Expense] = []
    
    var personalExpenses: [Expense] {
        expenses.filter {
            $0.type == .personal
        }
    }
    
    var businessExpenses: [Expense] {
        expenses.filter {
            $0.type == .business
        }
    }
}

fileprivate struct ExpenseListKey: EnvironmentKey {
    static var defaultValue: ExpenseList = ExpenseList()
}

extension EnvironmentValues {
    var expenseList: ExpenseList {
        get {
            self[ExpenseListKey.self]
        } set {
            self[ExpenseList.self] = newValue
        }
    }
}
