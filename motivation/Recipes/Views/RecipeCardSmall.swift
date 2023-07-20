//
//  RecipeCardSmall.swift
//  motivation
//
//  Created by Bernadette Werneke on 20.07.23.
//

import SwiftUI

struct RecipeCardSmall: View {
    @StateObject var vm = RecipeViewModel()
    var recipe: Recipe
    
    var body: some View {
        HStack{
            VStack{
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(alignment: .top) {
                            Text(recipe.name)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.yellow)
                                .shadow(color: .black, radius: 3, x: 0, y:0)
                                .frame(maxWidth: 146)
                                .padding(.top, 4)
                        }
                } placeholder: {
                    
                    ZStack{
                        ProgressView()
                            .frame(width: 150, height: 150, alignment: .center)
                        
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .center)
                            .opacity(0.1)
                    }
                }
            }
            .frame(width: 166, height: 217, alignment: .top)
            .clipShape((RoundedRectangle(cornerRadius: 20, style: .continuous)))
           
        }
    }
}
struct RecipeCardSmall_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardSmall(recipe: Recipe.dummyRecipe)
    }
}
