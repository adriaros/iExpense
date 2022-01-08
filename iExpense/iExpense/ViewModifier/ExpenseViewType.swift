//
//  ExpenseViewType.swift
//  iExpense
//
//  Created by Adrià Ros on 8/1/22.
//

import Foundation

enum ExpenseViewType: Equatable {
    
    case cheap
    case medium
    case expensive
    
    init(amount: Double) {
        if amount <= 10 {
            self = .cheap
        } else if amount > 10 && amount <= 100 {
            self = .medium
        } else {
            self = .expensive
        }
    }
}
