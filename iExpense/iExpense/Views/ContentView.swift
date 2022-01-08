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
    
    /// Track if the add view is shown or not
    @State private var showingAddExpense = false
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
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
