//
//  AddView.swift
//  iExpense
//
//  Created by Abul Kalam Azad on 2/8/23.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expneses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let expenseType = ["Personal", "Business"]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Cost Type", selection: $type) {
                    ForEach(expenseType, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .toolbar(content: {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            })
            .navigationTitle("Add new expense")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expneses())
    }
}
