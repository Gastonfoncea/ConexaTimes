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
            print("url is NOT valid")
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
                print("Invalid response")
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("Invalid response: \(response.statusCode)")
                completion(.failure(.invalidResponse))
                return
            }
            
            
            guard let data = data else {
                print("Invalid Data")
                completion(.failure(ErrorService.invalidData))
                return
            }
            
            do {
                let news = try JSONDecoder().decode([NewsModel].self, from: data)
                completion(.success(news))
                
            } catch {
                print(error)
                completion(.failure(ErrorService.unknown("Unknow Error" as! Error)))
            }
        }
        task.resume()
    }
    
    
    func fetchUsers(completion: @escaping(Result<[UsersModel],ErrorService>) ->Void) {
        
        guard let url = URL(string: baseUrlusers) else {
            print("url is NOT valid")
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
                print("Invalid Response")
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("Invalid Response: \(response.statusCode)")
                completion(.failure(.invalidResponse))
                return
            }
            
            
            guard let data = data else {
                print("Invalid user data")
                completion(.failure(ErrorService.invalidData))
                return
            }
            
            
            do {
                let users = try JSONDecoder().decode([UsersModel].self, from: data)
              //  print("el fetch de usuarios funciona")
                completion(.success(users))
            } catch {
                print(error)
                completion(.failure(ErrorService.invalidData))
            }
        }
        task.resume()
    }

    
    
    
    
    
}







