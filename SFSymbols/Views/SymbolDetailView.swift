//
//  SymbolDetailView.swift
//  SFSymbols
//
//  Created by Egor on 27/06/2019.
//  Copyright © 2019 Reshetov Egor. All rights reserved.
//

import SwiftUI

struct SymbolDetailView : View {
    var symbol: String
    
    let scales = [Image.Scale.small, Image.Scale.medium, Image.Scale.large]
    @State var scaleNumber = 1

    let weights = [Font.Weight.ultraLight,
                   Font.Weight.thin,
                   Font.Weight.light,
                   Font.Weight.regular,
                   Font.Weight.medium,
                   Font.Weight.semibold,
                   Font.Weight.bold,
                   Font.Weight.heavy,
                   Font.Weight.black]
    let weightsString = ["UltraLigh",
                         "Thin",
                         "Light",
                         "Regular",
                         "Medium",
                         "Semibold",
                         "Bold",
                         "Heavy",
                         "Black"]
    @State var weightNumber: Float = 3
    
    @State var red: Double = 125 / 255.0
    @State var green: Double = 125 / 255.0
    @State var blue: Double = 125 / 255.0
    
    var body: some View {
        VStack {
            Group {
                Text("R: \(String(format: "%.0f", red * 255.0)) G: \(String(format: "%.0f", green * 255.0)) B: \(String(format: "%.0f", blue * 255.0))")
                Image(systemName: symbol).font(Font.title.weight(weights[Int(weightNumber)])).foregroundColor(Color(red: red, green: green, blue: blue)).imageScale(scales[scaleNumber])
                Text("Name: \(symbol)").font(.headline)
            }
            Group {
                VStack {
                    SegmentedControl(selection: $scaleNumber) {
                        Text("Small").tag(0)
                        Text("Medium").tag(1)
                        Text("Large").tag(2)
                    }.padding(.horizontal, 30)
                    Text("\(weightsString[Int(weightNumber)])")
                    HStack {
                        Text("Weight:").padding(.leading, 25)
                        Slider(value: $weightNumber, from: 0, through: 8, by: 1).padding(.trailing, 25)
                    }
                }
            }
            Group {
                VStack {
                    Text("Red")
                    HStack {
                        Text("0")
                        Slider(value: $red)//.padding(.horizontal, 25)
                        Text("255")
                    }.padding(.horizontal, 25)
                    Text("Green")
                    HStack {
                        Text("0")
                        Slider(value: $green)//.padding(.horizontal, 25)
                        Text("255")
                    }.padding(.horizontal, 25)
                    Text("Blue")
                    HStack {
                        Text("0")
                        Slider(value: $blue)//.padding(.horizontal, 25)
                        Text("255")
                    }.padding(.horizontal, 25)
                }
            }
        }
    }
}
