//
//  ContentView.swift
//  SFSymbols
//
//  Created by Egor on 27/06/2019.
//  Copyright © 2019 Reshetov Egor. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    
    let listCount = (0..<symbols.count)
    
    var body: some View {
        NavigationView {
            List(listCount) { index in
                NavigationButton(destination: SymbolDetail(symbol: symbols[index])) {
                    SymbolRow(symbol: symbols[index])
                }
            }
        }
//        VStack {
//            Text("R: \(String(format: "%.0f", red * 255.0)) G: \(String(format: "%.0f", green * 255.0)) B: \(String(format: "%.0f", blue * 255.0))")
//            Rectangle().fill(Color(red: red, green: green, blue: blue)).frame(width: 50, height: 50, alignment: .center)
//            Text("Red").padding(.top, 150)
//            Slider(value: $red).padding(.horizontal, 15)
//            Text("Green")
//            Slider(value: $green).padding(.horizontal, 15)
//            Text("Blue")
//            Slider(value: $blue).padding(.horizontal, 15)
//        }
    }
}

struct SymbolRow: View {
    var symbol: String
    
    var body: some View {
        HStack {
            Image(systemName: symbol).foregroundColor(Color.gray)
            Divider()
            Text(symbol)
        }
    }
}

struct SymbolDetail: View {
    var symbol: String
    
    @State var red: Double = 0
    @State var green: Double = 0
    @State var blue: Double = 0
    
    var body: some View {
        VStack {
            Text("R: \(String(format: "%.0f", red * 255.0)) G: \(String(format: "%.0f", green * 255.0)) B: \(String(format: "%.0f", blue * 255.0))")
            Image(systemName: symbol).foregroundColor(Color(red: red, green: green, blue: blue)).imageScale(.large).animation(Animation.basic().delay(0.25))
            Text(symbol).font(.headline)
            Text("Red").padding(.top, 150)
            Slider(value: $red).padding(.horizontal, 25)
            Text("Green")
            Slider(value: $green).padding(.horizontal, 25)
            Text("Blue")
            Slider(value: $blue).padding(.horizontal, 25)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
