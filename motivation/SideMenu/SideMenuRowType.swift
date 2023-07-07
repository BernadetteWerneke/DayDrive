//
//  SideMenuRowType.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.07.23.
//

import Foundation

enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case dataIF  //Intervallfasten Angaben allgemein
    case dataPerson //persönliche angaben
    case toLogOut      //abmelden
    
    var title: String{
        switch self {
        case .home:
            return "HomeView"
        case .dataIF:
            return "DataIFView"
        case .dataPerson:
            return "DataPersonView"
        case .toLogOut:
            return "HomeView"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "home"
        case .dataIF:
            return "favorite"
        case .dataPerson:
            return "chat"
        case .toLogOut:
            return "profile"
        }
    }
}
