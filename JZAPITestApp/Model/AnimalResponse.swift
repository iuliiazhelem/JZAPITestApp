//
//  AnimalResponse.swift
//  JZAPITestApp
//
//  Created on 10/9/22.
//

import Foundation

struct AnimalResponse: Codable {
    let name: String
    let latin_name: String
    let animal_type: String
    let active_time: String
    let length_min: String
    let length_max: String
    let weight_min: String
    let weight_max: String
    let lifespan: String
    let habitat: String
    let diet: String
    let geo_range: String
    let image_link: String
    let id: Int
}
