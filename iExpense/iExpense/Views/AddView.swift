//
//  AddView.swift
//  iExpense
//
//  Created by Adrià Ros on 8/1/22.
//

import SwiftUI

struct AddView: View {
    
    /// Environment knows the app stastus and views status
    @Environment(\.dismiss) var dismiss
    
    /// Observed Object is used when a observable object is read or modified
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    expenses.items.append(ExpenseItem(name: name, type: type, amount: amount))
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
