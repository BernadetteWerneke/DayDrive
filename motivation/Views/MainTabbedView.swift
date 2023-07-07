//
//  MainTabbedView.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.07.23.
//

import SwiftUI

struct MainTabbedView: View {
    var body: some View {
        //SideMenu
        @State var presentSideMenu = false
        @State var selectedSideMenuTab = 0
        
        TabView(selection: $selectedSideMenuTab){
    
            MyHomeView(presentSideMenu: $presentSideMenu)
                .tag(0)
                .tabItem {
                    Label("Home", systemImage: "house")
                        
                }
            
            TimerView()
                .tag(1)
                .tabItem {
                    Label("Timer", systemImage: "hourglass")
                }
            
            RecipeView()
                .tag(2)
                .tabItem {
                    Label("Recipes", systemImage: "fork.knife")
                }
                
        }
        SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
       
    }
   
}


struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabbedView()
    }
}
