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
    @State var isOpen: Bool = false
    var body: some View {
        GeometryReader { geometry in
            let reachedPoint = scrollPosition.y * -1 + topSafeArea + 72  < geometry.size.height
            ZStack(alignment: .top) {
                CustomScrollView(geometry: geometry, scrollPosition: $scrollPosition)
                VStack{Text("This is going to be a menu in the future").foregroundStyle(.white)}
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black)
                    .offset(x: isOpen ? 0 : geometry.size.width)
                    .animation(.easeInOut, value: isOpen)
                AnimatedHeaderView(geometry: geometry, topSafeArea: topSafeArea, reachedPoint: reachedPoint, isOpen: $isOpen)
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
