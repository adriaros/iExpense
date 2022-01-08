//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Adrià Ros on 8/1/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Double
}
