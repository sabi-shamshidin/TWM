//
//  RecipeData.swift
//  TWM
//
//  Created by Sabi on 27.02.2022.
//

import Foundation

struct RandomData: Decodable {
    let title: String
    let image: String
    let summary: String
}

struct Returned: Decodable {
    var recipes: [RandomData]
}
