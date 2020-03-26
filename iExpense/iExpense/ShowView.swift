//
//  ShowView.swift
//  iExpense
//
//  Created by Viettasc Doan on 3/26/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct ShowView: View {
    @State private var show = false
    
    var body: some View {
        Button("Show Sheet") {
            self.show.toggle()
        }
        .sheet(isPresented: $show) {
            SecondView(name: "Tyemtee")
        }
    }
}

struct ShowView_Previews: PreviewProvider {
    static var previews: some View {
        ShowView()
    }
}
