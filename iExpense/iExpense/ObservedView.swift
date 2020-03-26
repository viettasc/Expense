//
//  ObservedView.swift
//  iExpense
//
//  Created by Viettasc Doan on 3/26/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var first = "Tyemtee"
    @Published var last = "Tran"
}

struct ObservedView: View {
    
    @ObservedObject private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.last) \(user.first).")
            TextField("First name", text: $user.first)
            TextField("Last name", text: $user.last)
        }
    }
    
}

struct ObservedView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedView()
    }
}
