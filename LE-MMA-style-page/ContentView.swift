//
//  ContentView.swift
//  LE-MMA-style-page
//
//  Created by Macbook Pro on 15.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            CustomScrollView(geometry: geometry)
            HStack {
                NegativeTitle(geometry: geometry, text: "LE:MAO")
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .padding(.top)
                        .frame(width: 24, height: 24)
                        .padding()
                })
            }
        }
        .ignoresSafeArea()
        .background(.black)
    }
    
    
}


#Preview {
    ContentView()
}
