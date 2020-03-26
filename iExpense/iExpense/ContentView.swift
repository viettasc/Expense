//
//  ContentView.swift
//  iExpense
//
//  Created by Viettasc Doan on 3/26/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct Expense: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [Expense]()
    //        {
    //        didSet {
    //            let encoder = JSONEncoder()
    //            if let data = try? encoder.encode(items) {
    //                UserDefaults.standard.set(data, forKey: "Items")
    //            }
    //        }
    //    }
    //    init() {
    //        if let items = UserDefaults.standard.data(forKey: "Items") {
    //            let decoder = JSONDecoder()
    //            if let decoded = try? decoder.decode([Expense].self, from: items) {
    //                self.items = decoded
    //                return
    //            }
    //        }
    //        self.items = []
    //    }
}

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    @State private var show = false
    
    // size + color
    
    func style(amount: Int) -> Color {
        switch amount {
        case 0...9:
            return Color.orange
        case 10...100:
            return Color.blue
        default:
            return Color.pink
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 23) {
                Section(header: Text("Avatar")) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                        Image("expenseIcon")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .padding()
                    }
                    .frame(height: 231)
                }
                Section(header: Text("List")) {
                    List {
                        ForEach(expenses.items) { item in
                            HStack {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                Text("$\(item.amount)")
                                    .foregroundColor(self.style(amount: item.amount))
                            }
                        }
                        .onDelete(perform: remove(at:))
                    }
                    .navigationBarTitle("TyemteeExpense")
                    .navigationBarItems(leading: EditButton(),trailing:
                        Button(action: {
                            self.show = true
                        }) {
                            Image(systemName: "plus")
                        }
                    )
                        .sheet(isPresented: $show) {
                            Add2(expenses: self.expenses)
                    }
                }
            }
            .padding()
        }
        .foregroundColor(Color.pink.opacity(0.6))
    }
    
    func remove(at offsets: IndexSet) -> Void {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
