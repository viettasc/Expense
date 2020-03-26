//
//  AddView.swift
//  iExpense
//
//  Created by Viettasc Doan on 3/26/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @State private var numbers = [Int]()
    @State private var current = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: remove(at:))
                }
                Button("Add") {
                    self.numbers.append(self.current)
                    self.current += 1
                }
            }
            .navigationBarItems(leading: EditButton())
        }
        
    }
    
    func remove(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
