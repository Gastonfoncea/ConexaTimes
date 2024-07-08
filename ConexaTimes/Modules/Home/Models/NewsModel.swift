//
//  NewsModel.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import Foundation

struct NewsModel:Codable,Identifiable {
    var id: Int
    var title: String
    var content: String
    var image: URL
    var publishedAt: String
}
