//
//  ContentView.swift
//  SampleTipCalculator
//
//  Created by Malli on 24/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalPerRerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipeselection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipeValue = orderAmount / 100 * tipeselection
        let grandTotal = orderAmount + tipeValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter Total Amount", text: $checkAmount).keyboardType(.numberPad)
                    Picker("Number Of People to Split", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                Section (header: Text("Select Tip Percentage").bold()) {
                    Picker("", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count, id: \.self) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section (header: Text("Total Amount To Paid by Each Person").bold()) {
                    Text("\(totalPerRerson, specifier: "%.2f")").bold()
                }
            }
            .navigationBarTitle("Tip Calculator", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
