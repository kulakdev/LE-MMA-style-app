//
//  NegativeTitle.swift
//  LE-MMA-style-page
//
//  Created by Macbook Pro on 17.01.2024.
//

import SwiftUI

struct NegativeTitle: View {
    let geometry: GeometryProxy
    var text: String
    var font: Font = .system(size: 76, weight: .regular, design: .default)
    var paddingLeading: (Edge.Set, CGFloat) = (.leading, 0)
    var paddingTop: (Edge.Set, CGFloat) = (.top, 0)
    var body: some View {
        Text(text)
            .foregroundStyle(.white)
            .blendMode(.difference)
            .overlay(Text(text).blendMode(.hue))
            .overlay(Text(text).foregroundStyle(.white).blendMode(.overlay))
            .overlay(Text(text).foregroundStyle(.black).blendMode(.overlay))
            .font(font)
            .padding(paddingLeading.0, paddingLeading.1)
            .padding(paddingTop.0, paddingTop.1)
    }
}

#Preview {
    GeometryReader { geometry in
    NegativeTitle(geometry: geometry, text: "Test")
    }
}
