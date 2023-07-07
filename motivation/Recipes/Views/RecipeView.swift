//
//  RecipeView.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.07.23.
//

import SwiftUI

//Suchen von Rezepten mit Preview ein random-Rezept
struct RecipeView: View {
    @State private var search: String = ""
    @StateObject var vm =  RecipeViewModel()
    @State var isRecipeDetailView = false
    
    var body: some View {
        NavigationStack(path: $vm.navPath){
         
                VStack(alignment: .leading, spacing: 16){
                    
                    //menu button
                    Image(systemName: "line.3.horizontal")
                        .onTapGesture {
                            //TODO-------------------------------
                        }
                    
                    //title
                    VStack(alignment: .leading){
                        Text("What would you like")
                        Text("to eat today?")
                    }
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 15)
                    .padding(.top, 5)
                    
                    //search + filter
                    HStack{
                        HStack{
                            Image(systemName: "magnifyingglass")
                            TextField("Search for recipes", text: $search)
                        }
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(15)
                        
                        Image(systemName: "slider.horizontal.3")
                            .padding()
                            .background(.gray.opacity(0.1))
                            .cornerRadius(15)
                            .onTapGesture {
                                //TODO-------------------------------
                            }
                    }.padding(.top, 15)
                    
                    Text("Today´s fresh recipe:")
                        .font(.title2)
                        .padding(.top, 15)
                    
                    
                    // 1 random Rezept mit Bild + Namen anzeigen
                    VStack{
//
                        AsyncImage(url: URL(string: vm.recipes?.image ?? ""))
                        {
                            phase in
                            switch phase{
                            case.empty: ProgressView()
                            case .success(let recipeImage): recipeImage
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 360, height: 360, alignment: .top)
                                    .overlay(alignment: .bottom) {
                                        Text(vm.recipes?.name ?? "")
                                            .font(.largeTitle)
                                            .bold()
                                            .foregroundColor(.yellow)
                                            .shadow(color: .black, radius: 3, x: 0, y:0)

                                            .frame(maxWidth: 350)
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
                                //.onTapGesture {
                         //   isRecipeDetailView.toggle()
                        //}
                       // NavigationLink(value: vm.recipes?.name) {RecipeDetailView()}
                    }
                    Spacer()
                   
                }
            }
            .padding()
        }
    }



struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
