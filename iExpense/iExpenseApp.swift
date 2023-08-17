//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Nowroz Islam on 17/8/23.
//

import SwiftUI

@main
struct iExpenseApp: App {
    var expenseList: ExpenseList = ExpenseList()
    
    var body: some Scene {
        WindowGroup {
            ListView()
        }
        .environment(\.expenseList, expenseList)
    }
}
