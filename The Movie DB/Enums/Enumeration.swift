//
//  ViewController.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import Foundation

enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
        rawValue
    }
}

enum RequestType: Int {
    case popular = 0
    case detail = 1
    case search = 2
}

enum Language: String {
    case tr = "tr"
    case en = "en"
    case none = ""
}

enum VideoProvider {
    case youtube, vimeo
}
