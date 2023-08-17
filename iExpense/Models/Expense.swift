//
//  Expense.swift
//  iExpense
//
//  Created by Nowroz Islam on 17/8/23.
//

import SwiftUI

@Observable final class Expense: Identifiable {
    var name: String
    var amount: Double
    var type: ExpenseType
    
    init(name: String, amount: Double, type: ExpenseType) {
        self.name = name
        self.amount = amount
        self.type = type
    }
}

extension Expense {
    enum ExpenseType: String, CaseIterable, Identifiable {
        case personal = "Personal"
        case business = "Business"
        
        var id: Self {
            self
        }
    }
}

extension Expense {
    var amountColor: Color {
        if amount < 100.0 {
            return .green
        } else if amount < 1000.0 {
            return .orange
        } else {
            return .red
        }
    }
}

extension Expense: Hashable {
    static func == (lhs: Expense, rhs: Expense) -> Bool {
        lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

