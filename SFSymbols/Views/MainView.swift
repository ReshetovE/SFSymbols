//
//  MainView.swift
//  SFSymbols
//
//  Created by Egor on 27/06/2019.
//  Copyright © 2019 Reshetov Egor. All rights reserved.
//

import SwiftUI

struct MainView : View {
    
    var body: some View {
        NavigationView {
            ListView()
        }
    }
}

struct ListView: View {
    @State var text = ""
    @State var isActiveBar = false
    var body: some View {
        List {
            Section(header: SearchBarView(text: $text, isActiveBar: $isActiveBar).animation(.basic())) {
                ForEach(0..<self.search(query: self.text).count) { index in
                    NavigationButton(destination: SymbolDetailView(symbol: self.search(query: self.text)[index])) {
                        SymbolRow(symbol: self.search(query: self.text)[index])
                    }
                }
            }
        }.navigationBarTitle(Text("SF Symbols"))
    }
    
    func search(query: String) -> [String] {
        var filtredSymbols = symbols
        if !text.isEmpty {
            filtredSymbols = []
            filtredSymbols = symbols.filter { symbol in
                symbol.lowercased().contains(query.lowercased())
            }
        }
        return filtredSymbols
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

#if DEBUG
struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
