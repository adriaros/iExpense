//
//  ContentView.swift
//  iExpense
//
//  Created by Adrià Ros on 8/1/22.
//

import SwiftUI

struct ContentView: View {
    
    /// State Object is used when a observable object is CREATED
    @StateObject var expenses = Expenses()
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    expenses.items.append(ExpenseItem(name: "Test", type: "Personal", amount: 5))
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
