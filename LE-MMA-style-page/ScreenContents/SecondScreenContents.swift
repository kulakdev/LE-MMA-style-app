//
//  SecondScreenContents.swift
//  LE-MMA-style-page
//
//  Created by Macbook Pro on 20.01.2024.
//

import SwiftUI


struct SecondScreenContents: View {
    let geometry: GeometryProxy
    @Binding var scrollPosition: CGPoint
    
    var body: some View {
        VStack {
            HStack {
                buildScrollyThing()
                Spacer()
                buildScrollyThing()
            }
            Spacer()
            Text("lorem ipsum dolor " + String(describing: scrollPosition.y))
                .foregroundStyle(.white)
                .font(.system(size: 32))
            
                
        }
        .frame(maxWidth: .infinity, maxHeight: geometry.size.height)
        .background(.blue)
        .clipShape(.rect(cornerRadius: 20, style: .continuous))
        .zIndex(2.0)
        .frame(height: geometry.size.height )
    }
    
    @ViewBuilder
    func buildScrollyThing() -> some View {
        var rotation: CGFloat = -scrollPosition.y * 0.5
        Image(uiImage: UIImage(named: "deco_shape")!)
            .resizable()
            .frame(width: 76, height: 76)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 38)
                    .inset(by: -1)
                    .offset(x: 1)
                    .strokeBorder(.white, lineWidth: 1.0)
            })
            .rotationEffect(.degrees(rotation))
            .animation(.easeInOut, value: rotation)
            .padding()
    }
}
