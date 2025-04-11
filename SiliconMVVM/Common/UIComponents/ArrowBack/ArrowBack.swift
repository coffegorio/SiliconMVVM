//
//  ArrowBack.swift
//  SiliconMVVM
//
//  Created by Егорио on 12.04.2025.
//

import SwiftUI

struct ArrowBack: View {
    
    var action: () -> Void = {}
    
    var body: some View {
        
        Button {
            action()
        } label: {
            Image(systemName: "arrow.backward")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundStyle(Color("TextColor"))
        }
    }
}
