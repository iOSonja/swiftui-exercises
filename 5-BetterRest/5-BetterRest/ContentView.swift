//
//  ContentView.swift
//  5-BetterRest
//
//  Created by Sonja Ek on 17.11.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    
    var body: some View {
        DatePicker("Please enter a date", selection:
            $wakeUp, displayedComponents:
                .hourAndMinute)
                 .labelsHidden()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
