//
//  ContentView.swift
//  UnitConversion
//
//  Created by Nicholas Nicholson on 5/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputNumber = 0
    @State private var inputUnit = "m"
    @State private var outputUnit = "m"
    @State private var outputNumber = 0
    
    var convertedValue: Measurement<UnitLength> {
        let baseValue = SetBaseValue(input: inputUnit)
        //
        var convertedValue = baseValue
        
        if (outputUnit == UnitLength.meters.symbol){
            convertedValue = baseValue.converted(to: UnitLength.meters)
        }
        else if (outputUnit == UnitLength.kilometers.symbol){
            convertedValue = baseValue.converted(to: UnitLength.kilometers)
        }
        else if (outputUnit == UnitLength.feet.symbol){
            convertedValue = baseValue.converted(to: UnitLength.feet)
        }
        else if (outputUnit == UnitLength.yards.symbol){
            convertedValue = baseValue.converted(to: UnitLength.yards)
        }
        else if (outputUnit == UnitLength.miles.symbol){
            convertedValue = baseValue.converted(to: UnitLength.miles)
        }
        
        return convertedValue
    }
    
    //let temperatureConversion = ["Celsius", "Fahrenheit", "Kelvin"]
    let lengthConvert = [UnitLength.meters.symbol, UnitLength.kilometers.symbol, UnitLength.feet.symbol, UnitLength.yards.symbol, UnitLength.miles.symbol]
    //let timeConversion = ["Seconds", "Minutes", "Hours", "Days"]
    
    
    func SetBaseValue(input: String) -> Measurement<UnitLength> {
        var baseValue = Measurement(value: Double(inputNumber), unit: UnitLength.meters)
        
        if (input == UnitLength.meters.symbol){
           baseValue =  Measurement(value: Double(inputNumber), unit: UnitLength.meters)
        }
        else if (input == UnitLength.kilometers.symbol){
            baseValue = Measurement(value: Double(inputNumber), unit: UnitLength.kilometers)
        }
        else if (input == UnitLength.feet.symbol){
            baseValue = Measurement(value: Double(inputNumber), unit: UnitLength.feet)

        }
        else if (input == UnitLength.yards.symbol){
            baseValue = Measurement(value: Double(inputNumber), unit: UnitLength.meters)

        }
        else if (input == UnitLength.miles.symbol){
            baseValue = Measurement(value: Double(inputNumber), unit: UnitLength.miles)

        }
        
        return baseValue
    }
    
    var body: some View {
        NavigationStack {
            Form{
                Section{
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(lengthConvert, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(lengthConvert, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                Section("Input A Value"){
                    HStack{
                        TextField("Input", value: $inputNumber, format: .number).keyboardType(.decimalPad)
                        Text("\(inputUnit)")
                    }
                    
                }
                Section("Converted Value"){
                    HStack{
                        Text("\(convertedValue.value)")
                        Text("\(convertedValue.unit.symbol)")
                    }
                }
                .navigationTitle("Length Conversion")
            }
            
        }
    }
}

#Preview {
    ContentView()
}
