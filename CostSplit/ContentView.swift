//
//  ContentView.swift
//  CostSplit
//
//  Created by Sam on 30/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var rentAmount = ""
    @State private var roomSize1 = ""
    @State private var roomSize2 = ""
    @State private var roomSize3 = ""
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("Total Rent Amount £\(rentAmount)")
            TextField("Total Rent", text: $rentAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
                .onChange(of: rentAmount) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.rentAmount = filtered
                    }
                }
            
            Text("Room 1 Size \(roomSize1)")
            TextField("Room 1 Size", text: $roomSize1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
                .onChange(of: roomSize1) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.roomSize1 = filtered
                    }
                }
            
            Text("Room 2 Size \(roomSize2)")
            TextField("Room 2 Size", text: $roomSize2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
                .onChange(of: roomSize2) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.roomSize2 = filtered
                    }
                }
            
            Text("Room 3 Size \(roomSize3)")
            TextField("Room 3 Size", text: $roomSize3)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
                .onChange(of: roomSize3) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.roomSize3 = filtered
                    }
                }
            
            let totalRent = asDouble(str: rentAmount)
            let totalRoomSize = asDouble(str: roomSize1) + asDouble(str: roomSize2) + asDouble(str: roomSize3)
            let room1Size = asDouble(str: roomSize1)
            let room2Size = asDouble(str: roomSize2)
            let room3Size = asDouble(str: roomSize3)
            
            let room1Rent = calculateRent(sizeOfRoom: room1Size, totalRoomSize: totalRoomSize, totalRent: totalRent)
            let room2Rent = calculateRent(sizeOfRoom: room2Size, totalRoomSize: totalRoomSize, totalRent: totalRent)
            let room3Rent = calculateRent(sizeOfRoom: room3Size, totalRoomSize: totalRoomSize, totalRent: totalRent)
            VStack {
                Text("Room 1 rent = \(room1Rent).")
                Text("Room 2 rent = \(room2Rent).")
                Text("Room 3 rent = \(room3Rent).")
            }
        }
    }
}

func asDouble(str: String) -> Double {
    return (str as NSString).doubleValue
}

func calculateRent(sizeOfRoom: Double, totalRoomSize: Double, totalRent: Double) -> Double {
    return totalRent * sizeOfRoom / totalRoomSize
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
