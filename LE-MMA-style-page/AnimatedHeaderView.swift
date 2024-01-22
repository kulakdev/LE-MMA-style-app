//
//  AnimatedHeaderView.swift
//  LE-MMA-style-page
//
//  Created by Macbook Pro on 20.01.2024.
//

import SwiftUI

struct AnimatedHeaderView: View {
    var geometry: GeometryProxy
    var topSafeArea: CGFloat
    var reachedPoint: Bool
    
    // MARK: TEMPORARY
    @State var isOpen: Bool = false
    
    var body: some View {
        HStack {
            ZStack(alignment: .topLeading) {
                // BIG
                NegativeTitle(geometry: geometry, text: "LE:MAO", paddingLeading: (.leading, 12), paddingTop: (.top, topSafeArea))
                    .offset(y: reachedPoint ? 0 : -topSafeArea - 100)
                    .animation(
                        !reachedPoint ?
                            .timingCurve(1.0, 0.1, 1, 0.65, duration: 0.4).delay(0.2)
                        :
                            .timingCurve(0.15, 0.86, 0.16, 0.98, duration: 0.6).delay(0.8),
                        value: reachedPoint
                    )
                    .onChange(of: reachedPoint) {
                        print("Hellow!!!")
                    }
                // smol
                NegativeTitle(geometry: geometry, text: "LE:MAO", font: .system(size: 36, weight: .regular, design: .default), paddingLeading: (.leading, 12), paddingTop: (.top, topSafeArea))
                    .offset(y: !reachedPoint ? 12 : -topSafeArea - 100)
                    .animation(
                        reachedPoint ?
                            .timingCurve(1.0, 0.1, 1, 0.65, duration: 0.4).delay(0.2)
                        :
                            .timingCurve(0.15, 0.86, 0.16, 0.98, duration: 0.6).delay(0.8),
                        value: reachedPoint
                    )
                    .onChange(of: reachedPoint) {
                        print("Byebye!!!")
                    }
            }
            Spacer()
            Button(action: {isOpen.toggle()}, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 18)
                        .frame(width: 100, height: 3)
                        .rotationEffect(isOpen ? .degrees(-45) : .degrees(0), anchor: .center)
                        .offset(y: !isOpen ? -4 : 0)
                        .animation(
                            !reachedPoint ? .bouncy : .bouncy.delay(0.1), value: reachedPoint)
                    RoundedRectangle(cornerRadius: 18)
                        .frame(width: 100, height: 3)
                        .rotationEffect(isOpen ? .degrees(45) : .degrees(0), anchor: .center)
                        .offset(y: !isOpen ? 4 : 0)
                        .animation(reachedPoint ? .bouncy : .bouncy.delay(0.1), value: reachedPoint)
                }
//                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 52, height: 52)
                    .clipped()
//                    .background(.red)
                    .padding(.trailing, 18)
                    .padding(.top, reachedPoint ? topSafeArea : topSafeArea - 18)
                    .animation(!reachedPoint ? .spring : .spring, value: reachedPoint)
            })
        }
    }
}

#Preview {
    GeometryReader { geometry in
        AnimatedHeaderView(geometry: geometry, topSafeArea: geometry.safeAreaInsets.top, reachedPoint: false)
    }
}
