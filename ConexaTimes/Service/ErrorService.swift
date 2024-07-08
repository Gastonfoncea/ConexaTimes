//
//  ErrorService.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import Foundation

enum ErrorService: Error, LocalizedError {
    
    case invalidURL
    case serverError
    case invalidData
    case invalidResponse
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "La Url proporcionada no es valida"
            
        case .serverError:
            return "El servidor no estaria funcionando"
            
        case .invalidData:
            return "Los datos proporcionados no funcionan, proba de vuelta mas tarde"
            
        case .invalidResponse:
            return "Invalid response from the server, please try again"
            
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
