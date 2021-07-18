//
//  ContentView.swift
//  CostSplit
//
//  Created by Sam on 30/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var RentAmount: Double = 1.0
    @State private var Input: Double = 1.0
    @State private var Room1Size: Double = 1.0
    @State private var Room2Size: Double = 1.0
    @State private var Room3Size: Double = 1.0

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
        VStack {
            Text("Total Rent Amount")
            TextField("Total Rent Amount", value: $RentAmount, formatter: formatter)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//                .keyboardType(UIKeyboardType.numberPad)
            .onChange(of: RentAmount) {
                    
                    Text("Room 1 Size")
                    TextField("Room 1 Size", value: $Room1Size, formatter: formatter)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .keyboardType(UIKeyboardType.numberPad)
                    
                    Text("Room 2 Size")
                    TextField("Room 2 Size", value: $Room2Size, formatter: formatter)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .keyboardType(UIKeyboardType.numberPad)
                    
                    Text("Room 3 Size")
                    TextField("Room 3 Size", value: $Room3Size, formatter: formatter)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .keyboardType(UIKeyboardType.numberPad)
                
                    VStack {
                        Text("Room 1 rent = \(RentAmount * Room1Size / (Room1Size + Room2Size + Room3Size)).")
                        Text("Room 2 rent = \(RentAmount * Room2Size / (Room1Size + Room2Size + Room3Size)).")
                        Text("Room 3 rent = \(RentAmount * Room3Size / (Room1Size + Room2Size + Room3Size)).")
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
