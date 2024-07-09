//
//  Service.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import Foundation

class Service: ProtocolService {
    
    static let shared = Service()
    let baseUrlPosts = "https://jsonplaceholder.org/posts"
    let baseUrlusers = "https://jsonplaceholder.org/users"
    
    func fetchNews(completion: @escaping(Result<[NewsModel],ErrorService>) ->Void ) {
        guard let url = URL(string: baseUrlPosts) else {
            print("url NO valida")
            completion(.failure(ErrorService.invalidURL))
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) {data, response, error in
            
            if let error = error {
                print(error)
                completion(.failure(ErrorService.invalidResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("respuesta no valida")
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("Error en la respuesta: \(response.statusCode)")
                completion(.failure(.invalidResponse))
                return
            }
            
            
            guard let data = data else {
                print("datos no validos")
                completion(.failure(ErrorService.invalidData))
                return
            }
            
            do {
                let news = try JSONDecoder().decode([NewsModel].self, from: data)
//                print("Funciona \(news)")
                completion(.success(news))
            } catch {
                print(error)
                completion(.failure(ErrorService.unknown("Error desconocido" as! Error)))
            }
        }
        task.resume()
    }
    
    
    func fetchUsers(completion: @escaping(Result<[UsersModel],ErrorService>) ->Void) {
        
        guard let url = URL(string: baseUrlusers) else {
            print("url NO valida")
            completion(.failure(ErrorService.invalidURL))
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) {data, response, error in
            
            if let error = error {
                print(error)
                completion(.failure(ErrorService.invalidResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("respuesta no valida")
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("Error en la respuesta: \(response.statusCode)")
                completion(.failure(.invalidResponse))
                return
            }
            
            
            guard let data = data else {
                print("Datos de usuario no validos")
                completion(.failure(ErrorService.invalidData))
                return
            }
            
            
            do {
                let users = try JSONDecoder().decode([UsersModel].self, from: data)
                print("el fetch de usuarios funciona")
                completion(.success(users))
            } catch {
                print(error)
                completion(.failure(ErrorService.invalidData))
            }
        }
        task.resume()
    }

    
    
    
    
    
}







