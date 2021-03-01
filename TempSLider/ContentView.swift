//
//  ContentView.swift
//  TempSLider
//
//  Created by Adam Lea on 2/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderTempC = 23.0
    @State private var sliderTempF = 0.0
    
    var minimumTempC = -17.7778
    var maximumTempC = 50.0
    
    var minimumTempF = 0.0
    var maximumTempF = 122.0
    
    init() {
        self._sliderTempF = State(initialValue: sliderTempC * 9 / 5 + 32)
    }
    
    var body: some View {
        VStack {
            Text("Temperature in degrees Celcius").bold()
            HStack {
                Text("\(String(format: "%.2f", minimumTempC)) °C")
                
                Slider(value: Binding(get: {self.sliderTempC}, set:{newVal in self.sliderTempC = newVal
                    self.sliderTempF = self.sliderTempC * 9 / 5 + 32
                }),
                in: minimumTempC...maximumTempC)
                
                Text("\(String(format: "%.2f", maximumTempC)) °C")
            }.padding()
            
            Text("\(String(format: "%.2f", sliderTempC as Double)) °C").bold()
            
            Divider()
            
            Text("Temperature in degrees Fahrenheit").bold()
            
            HStack {
                Text("\(String(format: "%.2f", minimumTempF)) °F")
                
                Slider(value: Binding(get: {self.sliderTempF}, set:{newVal in self.sliderTempF = newVal
                    self.sliderTempC = (self.sliderTempF - 32) * 5 / 9
                }),
                in: minimumTempF...maximumTempF)
                
                Text("\(String(format: "%.2f", maximumTempF)) °F")
            }.padding()
            
            Text("\(String(format: "%.2f", sliderTempF as Double)) °F").bold()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
