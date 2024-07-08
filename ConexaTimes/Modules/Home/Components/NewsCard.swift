//
//  NewsCard.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import SwiftUI

struct NewsCard: View {
    var title: String
    @State var texto: String
    var image: URL
    var fecha: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.gray.opacity(0.1))
            VStack(alignment:.leading,spacing: 10) {
                HStack{
                    Text(title)
                        .font(.title2)
                        .foregroundStyle(.blackWhite)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                Text(texto)
                    .foregroundStyle(.blackWhite)
                    .multilineTextAlignment(.leading)
    
                AsyncImage(url:image) { returnedImage in
                    returnedImage
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 400)
                } placeholder: {
                    ImageLoading(height: 400)
                }
                
                HStack{
                    Image(systemName: "stopwatch.fill")
                        .foregroundStyle(.gray)
                    Text("Fecha de la noticia: \(fecha)")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
               Spacer()
            }
           
            .padding()
        }
        .padding(.bottom,5)
        .frame(height: 620)
        
    }
    
}
#Preview {
    NewsCard(title: "Noticia asdasdasdasd asd asd asd asdasdasd adasdasd adasda adasd", texto: "tenxto", image:URL(string: "picsum.photos/400/300")! , fecha: "04-05-24")
}
