//
//  HomeViewModel.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import Foundation


enum ViewState {
    case loading
    case loaded
    case error(ErrorService)
}


class HomeViewModel: ObservableObject {
    
    let service: ProtocolService
    @Published var state: ViewState = .loading
    @Published var arrayNews: [NewsModel] = []
    @Published var error: ErrorService?
    
    
    init(service: ProtocolService) {
        self.service = service
    }
    
    func fetchAllNews() {
        service.fetchNews { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.arrayNews = data
                    self.state = .loaded
                  //  print(self.arrayNews)
                case .failure(let error):
                    self.error = error
                    self.state = .error(error)
                }
            }
        }
    }
    
    
}
