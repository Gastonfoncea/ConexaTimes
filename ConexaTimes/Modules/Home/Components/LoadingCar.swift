//
//  LoadingCar.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import SwiftUI

struct LoadingCar: View {
    
    @State var show = false
    var center = (UIScreen.main.bounds.width / 2) + 110
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.gray.opacity(0.1))
            VStack(spacing:10){
                ImageLoading(height: 50)
                
                ImageLoading(height: 110)
                
                ImageLoading(height: 400)

            }
            .padding(.horizontal,20)
                  .onAppear{
                    withAnimation(Animation.linear.speed(0.40).delay(0)
                        .repeatForever(autoreverses: false)){
                            self.show.toggle()
                        }
              }
        }
        .frame(height: 620)
        .padding(.horizontal)
        .padding(.top,140)


    }
}

#Preview {
    LoadingCar()
}
