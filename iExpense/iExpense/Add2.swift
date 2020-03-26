//
//  Add2.swift
//  iExpense
//
//  Created by Viettasc Doan on 3/26/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct Add2: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    static let types = ["Business", "Personal"]
    @State private var show = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount, onCommit: {
                    
                })
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add")
            .navigationBarItems(trailing:
                Button("Save") {
                    if let amount = Int(self.amount) {
                        let item = Expense(name: self.name, type: self.type, amount: amount)
                        self.expenses.items.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        self.show.toggle()
                        print("is not integer")
                    }
                    
                }
            )
                .alert(isPresented: $show) {
                    Alert(title: Text("Unexpected"), message: Text("Integer"), dismissButton: .default(Text("Ok")))
            }
        }
        .foregroundColor(Color.pink.opacity(0.6))
    }
    
}

//struct Add2_Previews: PreviewProvider {
//    static var previews: some View {
//        Add2()
//    }
//}
