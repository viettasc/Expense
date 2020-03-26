//
//  UserDefault.swift
//  iExpense
//
//  Created by Viettasc Doan on 3/26/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct UserDefault: View {
    @State private var tap = UserDefaults.standard.integer(forKey: "Tap1")
    
    var body: some View {
        Button("Tap count: \(tap)") {
            self.tap += 1
            // set tap -> UserDefault
            // key name String
//            UserDefaults.standard.set(self.tap, forKey: "Tap")
//            self.tap = UserDefaults.standard.integer(forKey: "Tap1") + 2
        }
    }
}

struct UserDefault_Previews: PreviewProvider {
    static var previews: some View {
        UserDefault()
    }
}
