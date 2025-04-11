//
//  FloatingCirclesBackground.swift
//  SiliconMVVM
//
//  Created by Егорио on 12.04.2025.
//

import SwiftUI

struct FloatingCirclesBackground: View {
    let count: Int
    
    var body: some View {
        ZStack {
            ForEach(0..<count, id: \.self) { _ in
                FloatingCircle()
            }
        }
    }
}
