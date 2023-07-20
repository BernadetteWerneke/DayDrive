//
//  TabBar.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI

enum Tabs: String {
    case tasks
    case timer
    case recipes
    case settings
}

struct TabBar: View {
    
    @State var selectedTab: Tabs = .tasks
    
    var body: some View {
       
            TabView{
                
                MyHomeView()
                    .tag(Tabs.tasks)
                    .tabItem {
                        Label("MyHome", systemImage: "house")
                        
                    }
                
                TimerView()
                    .tag(Tabs.timer)
                    .tabItem {
                        Label("Timer", systemImage: "hourglass")
                    }
                
                RecipeView2()
                    .tag(Tabs.recipes)
                    .tabItem {
                        Label("Recipes", systemImage: "fork.knife")
                    }
                
                SettingView()
                    .tag(Tabs.settings)
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                
            }
            .navigationTitle(selectedTab.rawValue.capitalized)
            .accentColor(.yellow)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
