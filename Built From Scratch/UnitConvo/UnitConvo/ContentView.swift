//
//  ContentView.swift
//  Unit Convo
//
//  Created by Sonja Ek on 21.10.2020.
//
//TODO:
//- Allow conversion to the other direction
//- Make changes to the UI to make it look nicer
//- Add documentation


import SwiftUI


struct ContentView: View {
    
    @State private var checkCelsius = ""
    
    var fahrenheit: Double {
        let celsius = Double(checkCelsius) ?? 0
        
        return (celsius * (9/5) + 32)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Fill in the temperature in degrees Celsius")) {
                    TextField("Celsius", text: $checkCelsius)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Temperature converted to Fahrenheit:")) {
                    Text("\(fahrenheit, specifier: "%.1f") °F")                }
            }
            .navigationBarTitle("°C to °F Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
