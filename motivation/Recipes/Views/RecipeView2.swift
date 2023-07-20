//
//  RecipeView2.swift
//  motivation
//
//  Created by Bernadette Werneke on 20.07.23.
//

import SwiftUI

struct RecipeView2: View {
    @State private var searchText: String = ""
    @StateObject var vm =  RecipeViewModel()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack(path: $vm.navPath){
         
            ScrollView{
                LazyVGrid(columns: columns, spacing: 7 ) {
                    ForEach(vm.recipes, id: \.self) { recip in
                        RecipeCardSmall(recipe: recip)
                       
                    }
               }
           }
           .listStyle(.plain)
           .navigationTitle("Recipes")
           .onAppear{
               vm.fetchSearchRecipes()
           }
                  
                   
            }.searchable(text: $vm.searchText)
                .onChange(of: vm.searchText) { searchTxt in
                    if !searchTxt.isEmpty {
                        vm.recipes = vm.recipes.filter { $0.name.contains(vm.searchText) }
                        } else {
                            vm.fetchSearchRecipes()
                        }
                }
            }
           
        }
    


struct RecipeView2_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView2()
    }
}
