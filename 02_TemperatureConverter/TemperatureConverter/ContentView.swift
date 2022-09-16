//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Sonja Ek on 16.9.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var startValue = 0.0
    @State private var startUnit = "Celsius"
    @State private var targetUnit = "Fahrenheit"
    @FocusState private var inputFieldIsFocused: Bool
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var targetValue: Double {
        if startUnit == "Celsius" && targetUnit == "Fahrenheit" {
            return (startValue * 9/5) + 32
        } else if startUnit == "Fahrenheit" && targetUnit == "Celsius" {
            return (startValue - 32) * 5/9
        }  else if startUnit == "Kelvin" && targetUnit == "Celsius" {
            return startValue - 273.15
        } else if startUnit == "Kelvin" && targetUnit == "Fahrenheit" {
            return (startValue - 273.15) * 9/5 + 32
        } else if startUnit == "Celsius" && targetUnit == "Kelvin" {
            return startValue + 273.15
        } else if startUnit == "Fahrenheit" && targetUnit == "Kelvin" {
            return (startValue - 32) * 5/9 + 273.15
        }
        return startValue // in this case: startUnit == targetUnit
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Original temperature", value: $startValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputFieldIsFocused)
                    
                    Picker("Original unit", selection: $startUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("Temperature in \(startUnit)")
                }
                
                Section {
                    Text(targetValue, format: .number)
                    
                    Picker("Target unit", selection: $targetUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Temperature in \(targetUnit)")
                }
            }
            .navigationTitle("Temperature Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputFieldIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
