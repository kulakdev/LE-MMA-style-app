//
//  ContentView.swift
//  LE-MMA-style-page
//
//  Created by Macbook Pro on 15.01.2024.
//

import SwiftUI
import Inject

struct ContentView: View {
    let hardwareScreenSize = UIScreen.main.bounds.size
    let iphone15pro = 852.0
    let iphoneSE3 = 687.0
    var topSafeArea: CGFloat {
        hardwareScreenSize.height > iphoneSE3 ? 44.0 : 11.0
    }
    @ObservedObject private var iO = Inject.observer
    @State private var scrollPosition: CGPoint = .zero
    var body: some View {
        GeometryReader { geometry in
            var reachedPoint = scrollPosition.y * -1 + topSafeArea + 72  < geometry.size.height
            CustomScrollView(geometry: geometry, scrollPosition: $scrollPosition)
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
                Button(action: {}, label: {
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 32, height: 24)
                        .padding(.top, reachedPoint ? topSafeArea : topSafeArea - 36)
                        .padding(.trailing, 18)
                        .animation(!reachedPoint ? .spring.delay(0.4) : .spring.delay(0.8), value: reachedPoint)
                })
            }
        }
        .ignoresSafeArea()
        .background(.black)
        .enableInjection()
    }
    
    
}
extension UIScreen {
    static var topSafeArea: CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        return (keyWindow?.safeAreaInsets.top) ?? 0
    }
}


#Preview {
    ContentView()
}
