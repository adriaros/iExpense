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
                
                Section(ExpenseType.personal.rawValue) {
                    sectionBy(type: .personal)
                }
                
                Section(ExpenseType.business.rawValue) {
                    sectionBy(type: .business)
                }
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
    
    func sectionBy(type: ExpenseType) -> some View {
        
        ForEach(type == .personal ? expenses.personal : expenses.business) { item in
            
            HStack {
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .type(ExpenseViewType(amount: item.amount))
                    Text(item.type.rawValue)
                }
                
                Spacer()
                
                Text(item.amount, format: .currency(code: "USD"))
            }
            
        }
        .onDelete(perform: removeItems)
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
