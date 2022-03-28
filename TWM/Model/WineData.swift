//
//  WineData.swift
//  TWM
//
//  Created by Sabi on 27.02.2022.
//

import Foundation

struct WineData: Decodable {
    let title: String
    let description: String
    let imageUrl: String
}

struct ReturneD: Decodable {
    var recommendedWines: [WineData]
    let totalFound: Int
}

struct Url: Decodable {
    let uniqueURL: String
}
