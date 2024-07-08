//
//  DetailNew.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import SwiftUI

struct DetailNew: View {
    
    var title: String
    @State var texto: String
    var image: URL
    var fecha: String
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading,spacing: 10) {
                HStack{
                    Text(title)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                Text(texto)
    
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
               
            }
            .padding(20)
        }
    }
}

#Preview {
    DetailNew(title: "", texto: "", image: URL(string: "picsum.photos/400/300")!, fecha: "")
}
