//
//  FirstScreenContents.swift
//  LE-MMA-style-page
//
//  Created by Macbook Pro on 17.01.2024.
//

import SwiftUI

struct FirstScreenContents: View {
    let geometry: GeometryProxy
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer(minLength: geometry.size.height * 0.45)
                HStack {
                    Text("L:mao is a global creative studio rooted in effective business solutions in design, branding, motion and developing.\n\n We transform ideas and metaphors into a visual language that works effectively and helps your brand speak. \n\n We provide our partners with unique digital and strategic solutions that unlock your business and deliver value.")
                        .font(.system(size: 14))
                        .foregroundStyle(.white)
                        .frame(maxWidth: geometry.size.width * (2 / 3))
                        .padding(.horizontal, 12)
                        .offset(y: -geo.frame(in: .global).origin.y / 1.4)
                    Spacer()
                }
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Design, Motion")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                        NegativeTitle(geometry: geometry, text:"&Development", font: .system(size: 32, weight: .medium, design: .serif))
                            .italic()
                    }
                    
                    Spacer()
                }
                .padding(.leading, 12)
                .padding(.bottom, 24)
                .background(
                    Spacer()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.black.opacity(0.6))
                        .mask(LinearGradient(colors: [.clear, .white], startPoint:.top , endPoint: .bottom)
                             )
                )
                
                .foregroundStyle(.white)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .trailing)
        }
    }
}

#Preview {
    GeometryReader { proxy in
    FirstScreenContents(geometry: proxy)
    }
}
