//
//  ContentView.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    @State var search: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.error != nil {
                    ContentUnavailableView("error en la red", systemImage: "network.slash")
                    
                } else if viewModel.arrayNews.isEmpty {
                    LoadingCar()
                    
                } else {
                    VStack {
                        Header
                        ListNews
                    }
                }
            }
            .searchable(text: self.$search,prompt: "Busca tu Noticia")
            .navigationTitle("Conexa Times")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.fetchAllNews()
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(service: Service()))
}



//MARK: Exensions -
extension HomeView {
    
    private var Header: some View {
        VStack {
            HStack {
                Text("\(getDayDate())")
                    .font(.caption)
                    .foregroundStyle(.gray)
                Spacer()
            }
            
            HStack {
                Text("Noticias de hoy")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
        }
        .padding(.horizontal,20)
    }
    
    
    private var ListNews: some View {
        List {
            ScrollView {
                ForEach(viewModel.arrayNews.filter { data in
                    if self.search.isEmpty {
                        return true
                    } else {
                        return data.title.localizedCaseInsensitiveContains(self.search) ||
                        data.content.localizedCaseInsensitiveContains(self.search)
                    }
                })
                { data in
                    NavigationLink(destination: DetailNew(title: data.title, texto: data.content, image: data.image, fecha: data.publishedAt))
                    {
                        NewsCard(title: data.title, texto: String(data.content.prefix(120)), image: data.image, fecha: data.publishedAt)
                    }
                    .listRowSeparator(.hidden)
                }
                .listRowSpacing(20)
            }
        }
        .listStyle(.plain)
        
    }
    
}
