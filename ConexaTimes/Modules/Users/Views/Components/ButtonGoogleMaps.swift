//
//  ButtonGoogleMaps.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 07/07/2024.
//

import SwiftUI

struct ButtonGoogleMaps: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.black.opacity(0.7))
            Image("ButtonGoogle")
                .resizable()
                .scaledToFit()
                .padding(10)
        }
        .frame(maxWidth:40)
        .frame(height: 50)
    }
}

#Preview {
    ButtonGoogleMaps()
}
