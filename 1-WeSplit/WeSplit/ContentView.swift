//
//  ContentView.swift
//  WeSplit
//
//  Created by Sonja Ek on 18.10.2020.
//

// TODO:
// - Something should be done about the "-NaN" in "Amount per person" -field as the program starts
// - Also: the same field shows infinity when "Amount" has received input but "Number of people" hasn't.

import SwiftUI


struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var checkNumberOfPeople = ""
    @State private var tipPercentage = 2
        
    let tipPercentages = [10, 15, 20, 25, 0]
    
    
    var totalAmount: Double {
        // This function calculates the overall value with tip included
        
        let tipSelection = Double(tipPercentages[tipPercentage])
        var orderAmount = Double(checkAmount) ?? 0
        // Not accepting negative values:
        if !(orderAmount > 0) {
            orderAmount = 0
        }
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        // This function calculates how much of the bill each person has to pay
        
        var peopleCount = Double(checkNumberOfPeople) ?? 0
        // Not accepting negative values:
        if !(peopleCount > 0) {
            peopleCount = 0
        }

        let amountPerPerson = totalAmount / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                
                    TextField("Number of people", text: $checkNumberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total amount")) {
                    Text("\(totalAmount, specifier: "%.2f")€") // no problem with the output here
                        .foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : .black)
                }
                
                Section(header: Text("Amount per person")) {
                    // BUG AHOY: this output shows "-NaN€" when the program starts. It should be "0.00€".
                    Text("\(totalPerPerson, specifier: "%.2f")€")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
