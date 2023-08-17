//
//  SectionView.swift
//  iExpense
//
//  Created by Nowroz Islam on 17/8/23.
//

import SwiftUI

struct SectionView: View {
    @Environment(\.expenseList) var expenseList
    
    var expenses: [Expense]
    
    let currencyCode: String = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        ForEach(expenses) { expense in
            HStack {
                VStack(alignment: .leading) {
                    Text(expense.name)
                    
                    Text(expense.type.rawValue)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Text(expense.amount, format: .currency(code: currencyCode))
                    .foregroundStyle(expense.amountColor)
            }
        }
        .onDelete(perform: delete)
        
    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            let expense = expenses[index]
            expenseList.expenses.removeAll {
                $0 === expense
            }
        }
    }
}

#Preview {
    List {
        Section("Personal") {
            SectionView(expenses: [Expense(name: "Toothbrush", amount: 2.25, type: .personal)])
        }
    }
}
