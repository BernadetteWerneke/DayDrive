//
//  RecipeAllView.swift
//  motivation
//
//  Created by Bernadette Werneke on 21.07.23.
//

import SwiftUI

struct RecipeAllView: View {
    
    var recipe: Recipe
    
    @State private var search: String = ""
    @StateObject var vm =  RecipeViewModel()
    @State var isRecipeDetailView = false
    let rows = [GridItem(.flexible(minimum: 50, maximum: 150))]
    
    var body: some View {
        NavigationStack(path: $vm.navPath){
            
            VStack{
                
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHGrid(rows: rows) {
                         ForEach(vm.recipes, id: \.self) { recip in
                          //   RecipeAllView(recipe: recip)
                         RecipeCardSmall(recipe: recip)
                         }
                        /*ForEach(0x1f600...0x1f679, id: \.self) { value in
                            Rectangle()
                        }*/
                    }
                }.frame(height: 130)
                    .padding(.top, 15)
                
                
                // 1 random Rezept mit Bild + Namen anzeigen
                VStack(alignment: .leading, spacing: 16){
                    
                    Text("Today´s fresh recipe:")
                        .font(.title2)
                        .padding(.top, 15)
                    
                    VStack{
                        
                        //AsyncImage(url: URL(string: vm.recipe?.image ?? ""))
                        AsyncImage(url: URL(string: recipe.image))
                        {
                            phase in
                            switch phase{
                            case.empty: ProgressView()
                            case .success(let recipeImage): recipeImage
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 270, height: 270, alignment: .top)
                                    .overlay(alignment: .bottom) {
                                        //Text(vm.recipe?.name ?? "")
                                        Text(recipe.name)
                                            .font(.largeTitle)
                                            .bold()
                                            .foregroundColor(.yellow)
                                            .shadow(color: .black, radius: 3, x: 0, y:0)
                                        
                                            .frame(maxWidth: 250)
                                            .padding()
                                    }
                                    .background(.gray.opacity(0.1))
                                    .clipShape((RoundedRectangle(cornerRadius: 20, style: .continuous)))
                                
                            case .failure(_): Image(systemName: "exclamationmark.triangle")
                            @unknown default: Text("Fail")
                            }
                        }
                        .onAppear{
                            vm.getRamdomRecipe()
                        }
                    }
                }//Vstack random
                .padding(.top, 16)
                Spacer()
                
            }//Vstack
            .navigationTitle("Recipes")
            .searchable(text: $vm.searchText)
            /* .onChange(of: vm.searchText) { searchTxt in
             if !searchTxt.isEmpty {
             vm.recipes = vm.recipes.filter { $0.name.contains(vm.searchText) }
             } else {
             vm.fetchSearchRecipes()
             }
             }*/
        }
        .padding()
        }
    }


struct RecipeAllView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeAllView(recipe: Recipe.dummyRecipe)
    }
}
