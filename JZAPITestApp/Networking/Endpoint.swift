//
//  Endpoint.swift
//  JZAPITestApp
//
//  Created on 10/9/22.
//

protocol Endpoint {
    var path: String { get }
}

enum InterestingInfo {
  case animals
}

extension InterestingInfo: Endpoint {
    var path: String {
        switch self {
        case .animals: return "https://zoo-animal-api.herokuapp.com/animals/rand/3"
        }
    }
}
