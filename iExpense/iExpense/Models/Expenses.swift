//
//  Expenses.swift
//  iExpense
//
//  Created by Adrià Ros on 8/1/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
