//
//  RecipeViewModel.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.07.23.
//

import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    
    @Published var recipes : Recipe? = nil //nur 1 random Rezept
    @Published var navPath = NavigationPath()
    
    
    //response ist 1 random Recipe
    func getRamdomRecipe() {
        let headers = [
            "X-RapidAPI-Key": "fc6dead686mshce7ea79da7d34dfp14c7a9jsn05cf4107d86e",
            "X-RapidAPI-Host": "low-carb-recipes.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://low-carb-recipes.p.rapidapi.com/random")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        //2
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            print(response as Any)
            guard let data = data, error == nil else {
                print(error as Any)
                return
            }
            
            //3
            do {
                let recipesFeed = try JSONDecoder().decode( Recipe.self, from: data)
                
                DispatchQueue.main.async {
                    self.recipes = recipesFeed //nur 1 Rezept
                    print(self.recipes)
                }
            } catch {
                print(error)
            }
        }
        
        //Mark: 4. API call starten
        task.resume()
    }
}
