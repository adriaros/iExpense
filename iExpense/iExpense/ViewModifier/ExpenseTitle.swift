//
//  ExpenseTitle.swift
//  iExpense
//
//  Created by Adrià Ros on 8/1/22.
//

import SwiftUI

struct ExpenseTitle: ViewModifier {
    
    var type: ExpenseViewType
   
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(type == .cheap ? .green : ( type == .medium ? .orange : .red))
    }
}

extension View {

    func type(_ type: ExpenseViewType) -> some View {
        self.modifier(ExpenseTitle(type: type))
    }
}

