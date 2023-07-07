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
            
            MyHomeView()
               // .tag(0)
                .tabItem {
                    Label("Home", systemImage: "house")
                        
                }
            
            TimerView()
               // .tag(1)
                .tabItem {
                    Label("Timer", systemImage: "hourglass")
                }
            
            RecipeView()
               // .tag(2)
                .tabItem {
                    Label("Recipes", systemImage: "fork.knife")
                }
                
        }
       
    }
   
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
