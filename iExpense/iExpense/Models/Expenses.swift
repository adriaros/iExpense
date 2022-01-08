//
//  Expenses.swift
//  iExpense
//
//  Created by Adrià Ros on 8/1/22.
//

import Foundation

class Expenses: ObservableObject {
    
    @Published var business = [ExpenseItem]()
    @Published var personal = [ExpenseItem]()
    
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
            filterItemsByType()
        }
    }
    
    init() {
        
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items.append(contentsOf: decodedItems)
                return
            }
        }
        
        items = []
        filterItemsByType()
    }
    
    private func filterItemsByType() {
        business = items.filter { $0.type == .business }
        personal = items.filter { $0.type == .personal }
        
        print("AQUI Business", business)
        print("AQUI Person", personal)
    }
}
