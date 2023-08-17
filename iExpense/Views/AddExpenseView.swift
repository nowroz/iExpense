//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Nowroz Islam on 17/8/23.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.expenseList) var expenseList
    
    @State private var name: String = ""
    @State private var amount: Double = 0
    @State private var type: Expense.ExpenseType = .personal
    
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showingAlert: Bool = false
    
    let currencyCode: String = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name", text: $name)
                
                Picker("Expense type", selection: $type) {
                    ForEach(Expense.ExpenseType.allCases) { type in
                        Text(type.rawValue)
                    }
                }
                
                TextField("Enter Amount", value: $amount, format: .currency(code: currencyCode))
            }
            .navigationTitle("New Expense")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard trimmedName.isEmpty == false else {
                            displayAlert()
                            return
                        }
                        
                        let newExpense = Expense(name: trimmedName, amount: amount, type: type)
                        expenseList.expenses.append(newExpense)
                        dismiss()
                    }
                }
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func displayAlert() {
        alertTitle = "Empty Name"
        alertMessage = "The name cannot be empty"
        showingAlert = true
    }
}

#Preview {
    AddExpenseView()
}
