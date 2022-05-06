//
//  ContentView.swift
//  BetterRest
//
//  Created by Andrei Dobrinski on 2022-05-05.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        Stepper(
            "\(sleepAmount.formatted()) hours",
            value: $sleepAmount,
            in: 4...12,
            step: 0.25
        )
        DatePicker(
            "Please enter a date",
            selection: $wakeUp,
            in: Date.now...
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
