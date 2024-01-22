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
    @State private var currentlySelected: Int = 0
    
    func toggleCurrentText(n: Int) {
        if currentlySelected == n {
            currentlySelected = 0
        } else {
            currentlySelected = n
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    buildScrollyThing()
                    Spacer()
                    VStack {
                        Text("We Create")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Text("Digital")
                            .font(.system(size: 24, weight: .medium, design: .serif).italic())+Text(" Spaces").font(.system(size: 24, weight: .bold, design: .rounded))
                    }
                    Spacer()
                    buildScrollyThing()
                }
                .foregroundStyle(.white)
                HStack {
                    CurlyBraceNumberAndText(number: "01", title: "Quality", text: Strings.text1S, geometry: geometry)
                        .onTapGesture {
                            toggleCurrentText(n: 1)
                        }
                    Spacer()
                }
                HStack {
                    Spacer()
                    CurlyBraceNumberAndText(number: "02", title: "Creativity", text: Strings.text2S, geometry: geometry)
                        .onTapGesture {
                            toggleCurrentText(n: 2)
                        }
                }
                CurlyBraceNumberAndText(number: "03", title: "Collaboration", text: Strings.text3S , geometry: geometry)
                    .onTapGesture {
                        toggleCurrentText(n: 3)
                    }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 2)
            .background(
                ZStack{
                    Image("BG2_5")
                        .resizable()
                        .scaledToFill()
                        .background(Color.red)
                    Image("BG2_1")
                        .resizable()
                        .scaledToFill()
                        .offset(y: -geo.frame(in: .global).origin.y / 2)
                    Image("BG2_4")
                        .resizable()
                        .scaledToFill()
                    Image("BG2_3")
                        .resizable()
                        .scaledToFill()
                        .offset(y: -geo.frame(in: .global).origin.y / 8)
                    Image("BG2_2")
                        .resizable()
                        .scaledToFill()
                    Image("BG2_GLOW")
                        .resizable()
                        .scaledToFill()
                        .offset(y: geo.frame(in: .global).origin.y / 8)

                        .mask(
                            Image("pog")
                                .resizable()
                                .scaledToFill())
                }
            )
            .clipShape(.rect(cornerRadius: 20, style: .continuous))
            .zIndex(2.0)
            .frame(height: geometry.size.height )
        }
    }
    
    @ViewBuilder
    func buildScrollyThing() -> some View {
        let rotation: CGFloat = -scrollPosition.y * 0.85
        Image(uiImage: UIImage(named: "deco_shape")!)
            .resizable()
            .frame(width: 64, height: 64)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 38)
                    .inset(by: -1)
                    .offset(x: 1)
                    .strokeBorder(.white, lineWidth: 1.0)
            })
            .rotationEffect(.degrees(rotation))
            .animation(.easeInOut, value: rotation)
            .padding(12)
    }
}

fileprivate struct Strings {
    static let text1S = "We believe that design and development should not only look good but also function well..."
    static let text2S = "We believe that every project should be unique and reflect the client's personality and vision..."
    static let text3S = "We think that communication and collaboration are key to the success of any project."
}
