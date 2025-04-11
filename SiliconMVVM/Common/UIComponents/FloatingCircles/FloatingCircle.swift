//
//  FloatingCircle.swift
//  SiliconMVVM
//
//  Created by Егорио on 12.04.2025.
//

import SwiftUI

struct FloatingCircle: View {
    @State private var position: CGPoint
    private let size: CGFloat
    private let animationDuration: Double
    
    init() {
        self.size = CGFloat.random(in: 120...170)
        self.animationDuration = Double.random(in: 6...12)
        self._position = State(initialValue: CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                                                     y: CGFloat.random(in: 0...UIScreen.main.bounds.height)))
    }
    
    var body: some View {
        Circle()
            .fill(Color("PastelPeriwinkle").opacity(0.3))
            .frame(width: size, height: size)
            .blur(radius: 15)
            .position(position)
            .onAppear {
                moveRandomly()
            }
    }
    
    private func moveRandomly() {
        withAnimation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: true)) {
            position = CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                               y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
        }
    }
}
