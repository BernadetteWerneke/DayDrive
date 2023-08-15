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
            "X-RapidAPI-Key": "46da00cabbmshd953d415fe9c716p1393abjsn33d25eeea8bf", //aktueller key
            //"X-RapidAPI-Key": "866e99e885msh6526f0a59099dd2p1bcc1ajsn05e0325167cb",  //veraltert
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
            // "X-RapidAPI-Key": "fc6dead686mshce7ea79da7d34dfp14c7a9jsn05cf4107d86e",   //veraltert
            "X-RapidAPI-Key": "866e99e885msh6526f0a59099dd2p1bcc1ajsn05e0325167cb",     //veraltert
            //"X-RapidAPI-Key": "46da00cabbmshd953d415fe9c716p1393abjsn33d25eeea8bf",   //aktueller key
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
