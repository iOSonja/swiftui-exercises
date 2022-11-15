//
//  ContentView.swift
//  iExpense
//
//  Created by Sonja Ek on 11.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var currentType = "Business"
    @State private var showingAddExpense = false

    let types = ["Business", "Personal"]

    var body: some View {
        NavigationView {
            List {
                Picker("Type of expense", selection: $currentType) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)

                ForEach(expenses.items.filter { $0.type == currentType }) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }

                            Spacer()
                            Text(item.amount, format: .currency(code: item.currency))
                        }
                        .padding(5)
                        .background(item.amount < 10 ? .mint : .yellow)
                        .foregroundColor(item.amount < 100 ? .primary : .red)
                        .cornerRadius(5)
                        .accessibilityElement()
                        .accessibilityLabel("\(item.name), \(item.amount) \(item.currency)")
                        .accessibilityHint("Type \(item.type)")
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
