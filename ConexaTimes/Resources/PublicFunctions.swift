//
//  PublicFunctions.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import Foundation


//func previewTextNew(texto:String) -> String {
//    let maxPreviewCharacters = 200
//    let wordsArray = texto.components(separatedBy: .whitespacesAndNewlines)
//    let preview = Array(wordsArray.prefix(200))
//    return preview
//}

func getDayDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "es_ES") // Set Spanish locale
    dateFormatter.dateFormat = "EEEE, dd MMMM" // Custom date format string
    return dateFormatter.string(from: Date()).uppercased()
}
