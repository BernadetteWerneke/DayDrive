//
//  RecipeViewModel.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.07.23.
//

import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    
    @Published var recipe : Recipe? = nil //nur 1 random Rezept
    @Published var navPath = NavigationPath()
    
    //search recipes
    @Published var searchText: String = ""
    @Published var recipes = [Recipe]()
    
    //fetch search Recipes
    func fetchSearchRecipes() {
        let headers = [
            "X-RapidAPI-Key": apiKey,
            "X-RapidAPI-Host": "low-carb-recipes.p.rapidapi.com"
        ]

       // let request = NSMutableURLRequest(url: NSURL(string: "https://low-carb-recipes.p.rapidapi.com/search?name=\(searchText)")! as URL,
        let request = NSMutableURLRequest(url: NSURL(string: "https://low-carb-recipes.p.rapidapi.com/search?")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        
        //2
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
       //     print(response as Any)
            guard let data = data, error == nil else {
                print(error as Any)
                return
            }
           
            //3
            do {
                let recipeFeed = try JSONDecoder().decode( [Recipe].self, from: data)
                
                DispatchQueue.main.async {
                    self.recipes = recipeFeed
                    print( recipeFeed)
                }
            } catch {
                print(error)
            }
        }
        
        //Mark: 4. API call starten
        task.resume()
    }
    

    
    
    //response ist 1 random Recipe
    func getRamdomRecipe() {
        let headers = [
            "X-RapidAPI-Key": apiKey,
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
                    self.recipe = recipesFeed //nur 1 Rezept
                    print(self.recipe)
                }
            } catch {
                print(error)
            }
        }
        
        //Mark: 4. API call starten
        task.resume()
    }
}
