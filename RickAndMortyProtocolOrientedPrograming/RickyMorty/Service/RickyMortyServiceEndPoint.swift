//
//  RickyMortyServiceEndPoint.swift
//  RickAndMortyProtocolOrientedPrograming
//
//  Created by Yildirim on 7.04.2023.
//

import Foundation

enum RickyMortyServiceEndpoint: String{
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"
    
    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}
