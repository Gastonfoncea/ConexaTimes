//
//  MockService.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 08/07/2024.
//

import Foundation

class MockServiceFailure: ProtocolService {
   
    
    let shouldReturnError: Bool
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    func fetchNews(completion: @escaping (Result<[NewsModel], ErrorService>) -> Void) {
        // Simula un error en la llamada a la API
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            completion(.failure(ErrorService.serverError))
        }
    }
    
    
    func fetchUsers(completion: @escaping (Result<[UsersModel], ErrorService>) -> Void) {
        // Simula un error en la llamada a la API
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            completion(.failure(ErrorService.serverError))
        }
    }
    
        
    
    
}
