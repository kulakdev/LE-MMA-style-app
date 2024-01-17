//
//  ParallaxImage.swift
//  LE-MMA-style-page
//
//  Created by Macbook Pro on 17.01.2024.
//

import SwiftUI

struct ParallaxImage<Content>: View where Content: View {
    let geometry: GeometryProxy
    let imageName: String
    let scrollSpeed: CGFloat = 1.75
    let enableTransitions: Bool = true
    let zIndex: CGFloat
    let isTopMost: Bool
    let content: () -> Content?

    private let customCurve: UnitCurve = UnitCurve.bezier(startControlPoint: UnitPoint(x: 0.05, y: 1), endControlPoint: UnitPoint(x: 0.17, y: 1))
    private let gigaAgressiveCurve: UnitCurve = UnitCurve.bezier(startControlPoint: UnitPoint(x: 1, y: 1.14), endControlPoint: UnitPoint(x: 1, y: 0.58))
    
    init(geometry: GeometryProxy,
         imageName: String = "underwater",
         content: @escaping () -> Content?,
         zIndex: CGFloat = -10,
         isTopMost: Bool = false
    ) {
        self.geometry = geometry
        self.imageName = imageName
        self.content = content
        self.zIndex = zIndex
        self.isTopMost = isTopMost
    }
    
    var body: some View {
        VStack {
            content()
        }
        .padding(.top)
        .background(
            GeometryReader { geo in Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(CGSize(width: 1.2, height: 1.2), anchor: .leading)
                    .frame(width: geometry.size.width , height:geometry.size.height)
                    .offset(y: -geo.frame(in: .global).origin.y/scrollSpeed)
            })
        .scrollTransition(
            topLeading: .interactive(timingCurve: UnitCurve.linear),
            bottomTrailing: .interactive,
            axis: .vertical) { view, phase in
            view
                .opacity( 1-(phase.value < 0 ? -phase.value: phase.value) )
                .offset(y: !isTopMost ? phase.value > 0 ? -geometry.size.height * 0.75: phase.value : 0)
        }
        .frame(width: geometry.size.width, height:geometry.size.height)
        .zIndex(zIndex)
    }
}

#Preview {
    GeometryReader { geometry in
        ParallaxImage(geometry: geometry, imageName: "underwater") {
            Text("test")
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
