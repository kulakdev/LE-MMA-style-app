//
//  CurlyBraceNumber+Text.swift
//  LE-MMA-style-page
//
//  Created by Macbook Pro on 21.01.2024.
//

import SwiftUI

struct CurlyBraceNumberAndText: View {
    var number: String
    var title: String
    var text: String
    var geometry: GeometryProxy

    var body: some View {
        HStack(alignment: .top) {
            HStack {
                Text("{")
                    .font(.system(size: 30, weight: .light, design: .serif))
                    .foregroundStyle(.white)
                Text(number)
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .light, design: .serif))
                    .italic()
                Text("}")
                    .font(.system(size: 30, weight: .light, design: .serif))
                    .foregroundStyle(.white)
            }
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundStyle(.white)
                    .font(.system(size: 32, weight: .medium, design: .default))
                Text(text)
                    .foregroundStyle(.white)
                    .font(.system(size: 14))
                    .padding(.top, 4.0)
                    .frame(maxWidth: geometry.size.width * 2/3)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    GeometryReader { geometry in
        let text = "We believe that design and development should not only look good but also function well. That's why we always strive for excellence and pay attention to the smallest details. Our goal is to create designs that not only meet but exceed your expectations."
        CurlyBraceNumberAndText(number: "01", title: "Quality", text: text, geometry: geometry)
    }
}
