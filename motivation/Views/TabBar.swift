//
//  TabBar.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
       
        TabView{
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            TimerView()
                .tabItem {
                    Label("Timer", systemImage: "hourglass")
                }
            
            RecipeView()
                .tabItem {
                    Label("Recipes", systemImage: "fork.knife")
                }
                
        }.accentColor(.yellow)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
