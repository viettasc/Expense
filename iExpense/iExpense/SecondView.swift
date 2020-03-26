//
//  SecondView.swift
//  iExpense
//
//  Created by Viettasc Doan on 3/26/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    var body: some View {
        VStack {
            Text("Hello \(name)")
            Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(name: "Tyemtee")
    }
}
