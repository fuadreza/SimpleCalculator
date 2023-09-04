//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by Fuad Reza Pahlevi on 04/09/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var inputA: String = ""
    @State var inputB: String = ""
    @State var result: String = "-"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Number A")
            TextField("Placeholder", text: $inputA)
                .textFieldStyle(.roundedBorder)
                .keyboardType(UIKeyboardType.numberPad)
                .onReceive(Just(inputA)) { newValue in
                    let filtered = newValue.filter {
                        "0123456789".contains($0)
                    }
                    if filtered != newValue {
                        self.inputA = filtered
                    }
                }
            Text("Number B")
            TextField("Placeholder", text: $inputB)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            HStack(alignment: .center) {
                Button("+") {
                    calculate(operatorSymbol: "+")
                }
                .padding()
                .buttonStyle(.bordered)
                Button("-") {
                    calculate(operatorSymbol: "-")
                }
                .padding()
                .buttonStyle(.bordered)
                Button("*") {
                    calculate(operatorSymbol: "*")
                }
                .padding()
                .buttonStyle(.bordered)
                Button("/") {
                    calculate(operatorSymbol: "/")
                }
                .padding()
                .buttonStyle(.bordered)
            }
            .frame(maxWidth: .infinity)
            Text("Result").bold().frame(maxWidth: .infinity)
            Text(result).frame(maxWidth: .infinity)
        }
        .padding()
    }
    
    func calculate(operatorSymbol: String) {
        if operatorSymbol == "+" {
            if (!inputA.isEmpty && !inputB.isEmpty) {
                result = String((Int(inputA) ?? 0) + (Int(inputB) ?? 0))
            }
        } else if operatorSymbol == "-" {
            if (!inputA.isEmpty && !inputB.isEmpty) {
                result = String((Int(inputA) ?? 0) - (Int(inputB) ?? 0))
            }
        }else if operatorSymbol == "*" {
            if (!inputA.isEmpty && !inputB.isEmpty) {
                result = String((Int(inputA) ?? 0) * (Int(inputB) ?? 0))
            }
        } else if operatorSymbol == "/" {
            if (!inputA.isEmpty && !inputB.isEmpty) {
                result = String(Double((Double(inputA) ?? 0) / (Double(inputB) ?? 0)))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
