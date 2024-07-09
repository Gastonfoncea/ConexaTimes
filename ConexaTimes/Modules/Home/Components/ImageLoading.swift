//
//  ImageLoading.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import SwiftUI

struct ImageLoading: View {
    
    var height:CGFloat
    @State var show = false
    var center = (UIScreen.main.bounds.width / 2) + 110
    
    var body: some View {
        ZStack{
           RoundedRectangle(cornerRadius: 10)
                .fill(Material.ultraThin)
                .frame(height:height)
               
            Color.white
                .frame(height: height)
                .cornerRadius(10)
                .mask(
                    Rectangle()
                        .fill(
                        
                            LinearGradient(gradient: .init(colors: [.clear,Color.white.opacity(0.55),.clear]), startPoint: .top, endPoint: .bottom)
                        )
                        .rotationEffect(.init(degrees: 70))
                        .offset(x: self.show ? center : -center)
                )
                
        }
       
        .foregroundStyle(.colorCardsLoading.opacity(0.5))
        .frame(maxWidth: .infinity)
        .frame(height: height)
        .onAppear{
            withAnimation(Animation.linear.speed(0.40).delay(0)
                .repeatForever(autoreverses: false)){
                    self.show.toggle()
                }
        }


    }
}

#Preview {
    ImageLoading(height: 75)
}
