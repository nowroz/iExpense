//
//  ContentView.swift
//  iExpense
//
//  Created by Nowroz Islam on 17/8/23.
//

import SwiftUI

struct ListView: View {
    @Environment(\.expenseList) var expenseList
    
    @State private var showingAddExpenseSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal: \(expenseList.personalExpenses.count)") {
                    SectionView(expenses: expenseList.personalExpenses)
                }
                
                Section("Business: \(expenseList.businessExpenses.count)") {
                    SectionView(expenses: expenseList.businessExpenses)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpenseSheet = true
                } label: {
                    Label("Add Expense", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpenseSheet) {
                AddExpenseView()
            }
        }
    }
}

#Preview {
    ListView()
}
