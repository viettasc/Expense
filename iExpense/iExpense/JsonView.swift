//
//  JaonView.swift
//  iExpense
//
//  Created by Viettasc Doan on 3/26/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct Person: Codable {
    var first: String
    var last: String
}

struct JsonView: View {
    
    @State private var user = Person(first: "Tyemtee", last: "Lomonoxop")
    
    var body: some View {
        // save json
        Button("Save") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "Data")
            }
        }
    }
    
}

struct JsonView_Previews: PreviewProvider {
    static var previews: some View {
        JsonView()
    }
}
