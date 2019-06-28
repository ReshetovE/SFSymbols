//
//  SearchBarView.swift
//  SFSymbols
//
//  Created by Egor on 28/06/2019.
//  Copyright © 2019 Reshetov Egor. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit

struct SearchBarView: View {
    @Binding var text: String
    @Binding var isActiveBar: Bool
    let color = Color.gray
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center, spacing: 0, content:  {
            ContainerView(text: $text, isActiveField: $isActiveBar).padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .frame(height: 60)
            Button(action: {
                self.isActiveBar = false
                self.text = ""
                self.endEditing(true)
            }) {
                Text("Cancel").color(color)
            }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: isActiveBar || !text.isEmpty ? 16 : -54))
        }).background(Color.white).listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct ContainerView: View {
    @Binding var text: String
    @Binding var isActiveField: Bool
    
    let color = Color(red: 184.0 / 255.0, green: 184.0 / 255.0, blue: 184.0 / 255.0)
    var body: some View {
        ZStack {
            BackgroundView()
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(color)
                    .padding(EdgeInsets(top: 12, leading: 14, bottom: 12, trailing: 10))
                
                TextField($text, placeholder: Text("Search symbol"), onEditingChanged: { isActive in
                    self.isActiveField = isActive
                }) {
                    self.endEditing(true)
                }
                
                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "multiply.circle")
                            .foregroundColor(Color.black)
                            .padding(EdgeInsets(top: 14, leading: 8, bottom: 14, trailing: 12))
                    }
                }
            }
        }
    }
}

struct BackgroundView: View {
    let color = Color(red: 217.0 / 255.0, green: 217.0 / 255.0, blue: 217.0 / 255.0).opacity(0.4)
    var body: some View {
        Rectangle()
            .fill(color)
            .cornerRadius(6)
    }
}
