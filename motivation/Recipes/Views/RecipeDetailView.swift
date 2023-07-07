//
//  RecipeDetailView.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.07.23.
//

import SwiftUI

struct RecipeDetailView: View {
    @StateObject var vm =  RecipeViewModel()
    var recipe: Recipe
    
    var body: some View {
        ScrollView{
            VStack{
                // TODO______________________________image mit opacity einfügen____________
        
                AsyncImage(url: URL(string: Recipe.dummyRecipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                } placeholder: {
                    ProgressView()
                }
                
                Text(Recipe.dummyRecipe.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .frame(maxWidth: 350)
                    .padding()
                
                Text(Recipe.dummyRecipe.description)
                    .font(.footnote)
                    .frame(height: 70)
                Text("\(Recipe.dummyRecipe.prepareTime) min")
                     .font(.headline)
                Text("\(Recipe.dummyRecipe.cookTime) min")
                    .font(.headline)
                
                Text("Ingredients:")
                    .font(.title)
                
                
                //steps         //TODO------------------
                //nutrients     //TODO------------------
            }
        }
        .padding()
    }
}


struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe.dummyRecipe)
    }
}
