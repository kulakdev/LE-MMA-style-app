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
                Text("L:MAO")
                    .foregroundStyle(.white)
                //                    .shadow(color: .black, radius: 0.4)
                    .blendMode(.difference)
                    .overlay(Text("L:MAO").blendMode(.hue))
                    .overlay(Text("L:MAO").foregroundStyle(.white).blendMode(.overlay))
                    .overlay(Text("L:MAO").foregroundStyle(.black).blendMode(.overlay))
                    .font(.system(size: 79))
                    .fontWeight(.light)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .padding(.leading, 14)
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .padding(.top)
                        .frame(width: 24, height: 24)
                        .padding()
                })
            }
        }.ignoresSafeArea()
            .background(.black)
    }
    
    
}

struct CustomScrollView: View {
    private var geometry: GeometryProxy
    init(geometry: GeometryProxy) {
        UIScrollView.appearance().bouncesZoom = true
        self.geometry = geometry
    }
    
    let customCurve: UnitCurve = UnitCurve.bezier(startControlPoint: UnitPoint(x: 0.05, y: 1), endControlPoint: UnitPoint(x: 0.17, y: 1))
    let gigaAgressiveCurve: UnitCurve = UnitCurve.bezier(startControlPoint: UnitPoint(x: 1, y: 1.14), endControlPoint: UnitPoint(x: 1, y: 0.58))
    
    @State private var offsetY: CGFloat = -80
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                Text("Hello, world!")
                    .background(.red)
            }
            .padding(.top, 64)
            .background(
                GeometryReader { geo in Image("underwater")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width , height:geometry.size.height)
                        .offset(y: -80-geo.frame(in: .global).origin.y/2)
                })
            .frame(width: geometry.size.width , height:geometry.size.height)
            .scrollTransition(topLeading: .interactive(timingCurve: UnitCurve.easeOut), bottomTrailing: .interactive, axis: .vertical) { view, phase in
                view
                    .opacity(1-(phase.value < 0 ? -phase.value: phase.value))
                    .offset(y: phase.value > 0 ? -geometry.size.height * 0.75: phase.value
                    )
            }
            
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

#Preview {
    ContentView()
}
