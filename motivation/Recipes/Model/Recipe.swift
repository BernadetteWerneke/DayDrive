//
//  Recipe.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.07.23.
//

import Foundation

struct Recipe: Codable, Hashable {
    var id: String
    var name: String
    var description: String
    var prepareTime: Int
    var cookTime: Int
    //var ingredients: [Ingredients]
   // var steps: [RecipeSteps]
   // var nutrients: Nutrients
    var image: String  //URL
    
    static var dummyRecipe = Recipe(id: "TestId", name: "TestName", description: "TestDescription: Instead of making pancakes or waffles, make this easy Keto breakfast recipe that takes way less time to make. This blueberry sponge cake in a mug is soft and fluffy like a pancake but sweet like a cake. Don’t worry, you won’t be adding many carbs to your breakfast, as all sweetening products are replaced with Keto-friendly ingredients. You can assemble the recipe in under 5 minutes, so this is also a great Keto breakfast recipe for anyone who always ends up in a rush in the mornings. Even if you’re in a rush, you can still enjoy this sweet and delicious sponge cake breakfast! If you want to serve your sponge cake with a little whipped cream, you can whip heavy cream and liquid stevia together in a stand mixer or food processor. ### Other ingredients to add Like to have a little more in your sponge cake? Try stirring in crushed nuts for more texture. Keto-friendly nuts include cashews, walnuts, pecan, hazelnuts, and even peanuts. Blueberries also happen to taste very good with lemon. Try mixing a little lemon zest in your dry ingredients! ### Can other berries be used? Blueberries are one of the most Keto-friendly berries out there. If you don’t like blueberries, try raspberries or strawberries. If you’re using strawberries in the mug cake, make sure to chop them finely. ### What type of mug should I use? A heat-safe mug or dish can easily be a coffee cup from your kitchen. Choose any type of ceramic mug to keep your hands safe as well as cook the sponge cake. If you own a ceramic ramekin, you can also cook your sponge cake in there.", prepareTime:30, cookTime: 45, image: "https://tinyurl.com/2p82zzca/2807982c-986a-4def-9e3a-153a3066af7a.png")
}
