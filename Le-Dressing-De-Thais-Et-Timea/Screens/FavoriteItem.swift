//
//  FavoriteItem.swift
//  Furniture_app
//
//  Created by William on 10/08/2024.
//

import Foundation

struct FavoriteItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let imageName: String
    let price: Double
}
