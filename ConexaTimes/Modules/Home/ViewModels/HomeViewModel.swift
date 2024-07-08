//
//  HomeViewModel.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    let service: Service
    @Published var arrayNews: [NewsModel] = []
    @Published var filteredNews: [NewsModel] = []
    @Published var error: ErrorService?
    
    
    init(service: Service) {
        self.service = service
    }
    
    func fetchAllNews() {
        Service.shared.fetchNews { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.arrayNews = data
                  //  print(self.arrayNews)
                case .failure(let error):
                    self.error = error
                }
            }
        }
    }
    
    
    
    func filterNews(query: String) {
           if query.isEmpty {
               filteredNews = arrayNews
           } else {
               filteredNews = arrayNews.filter { news in
                   news.title.localizedCaseInsensitiveContains(query) ||
                   news.content.localizedCaseInsensitiveContains(query)
               }
           }
       }
    
    
    
    
    
}
