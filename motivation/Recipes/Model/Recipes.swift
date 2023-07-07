//
//  Recipes.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.07.23.
//

import Foundation

struct Recipes: Codable, Identifiable, Hashable {
    var id = UUID()
    var recipes: [Recipe]
    
    static var dummyRecipe = Recipes(recipes: [Recipe.dummyRecipe])
}
