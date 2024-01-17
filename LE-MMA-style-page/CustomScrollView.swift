//
//  CustomScrollView.swift
//  LE-MMA-style-page
//
//  Created by Macbook Pro on 17.01.2024.
//

import Foundation
import SwiftUI

struct CustomScrollView: View {
    private var geometry: GeometryProxy

    init(geometry: GeometryProxy, content: (any View)? = nil) {
        UIScrollView.appearance().bouncesZoom = true
        self.geometry = geometry
    }
    
    @State private var offsetY: CGFloat = -80
    
    var body: some View {
        ScrollView {
            ParallaxImage(geometry: geometry, imageName: "underwater") {
                FirstScreenContents(geometry: geometry)
            }
            VStack {
                Text("lorem ipsum dolor ")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: geometry.size.height)
                    .background(.blue)
                    .zIndex(2.0)
            }
            .background(.black)
            .frame(height: geometry.size.height )
            ParallaxImage(geometry: geometry, imageName: "pexels5") {
                Text("loremIpsum")
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            VStack {
                Spacer()
                Text("Hello, world!")
                    .background(.red)
            }
            .padding(.top, 64)
            .background(
                GeometryReader { geo in Image("pexels5")
                        .resizable()
                        .scaledToFill()
                        .scaleEffect(CGSize(width: 1.2, height: 1.2), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .frame(width: geometry.size.width , height:geometry.size.height)
                        .offset(y: -geo.frame(in: .global).origin.y/2 + geo.frame(in: .global).height / 2)
                    
                })
            .frame(width: geometry.size.width, height:geometry.size.height)
            .scrollTransition(topLeading: .interactive(timingCurve: UnitCurve.easeOut), bottomTrailing: .interactive, axis: .vertical) { view, phase in
                view
                    .opacity(1 - (phase.value < 0 ? -phase.value / 3: phase.value))
                //                    .offset(y: phase.value > 0 ? -geometry.size.height * 0.75: phase.value                    )
            }
            .zIndex(-10.0)
            Color.blue
                .frame(height: geometry.size.height)
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding(.top, 64)
            .frame(width: geometry.size.width, height:geometry.size.height)
            .backgroundStyle(.green)
            .background(Image("pexels5")
                .resizable()
                .scaledToFill())
            .background(.green)
        }
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = false
        })
        .scrollIndicators(.hidden)
    }
}
