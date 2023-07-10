//
//  SettingsVM.swift
//  motivation
//
//  Created by Bernadette Werneke on 10.07.23.
//


import Foundation

enum SettingsTopic: String {
    
    case topic1 = "MyHome"
    case topic2 = "Intervall Fasting Data"
    case topic3 = "Personal Data"
    case topic4 = "Settings"

}




/*enum SettingsVM: Int, CaseIterable{
    case profile
    case fastingData
    case doshaTest
    case questionAnswer
    case logout
    
    var title: String {
        switch self {
        case .profile: return "ProfileView"
        case .fastingData: return "FavoriteView"
        case .doshaTest: return "ChatView"
        case .questionAnswer: return "TimerView"
        case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .fastingData: return "person.badge.clock"
        case .doshaTest: return "testtube.2"
        case .questionAnswer: return "questionmark.app"
        case .logout: return "arrow.left.square"
        }
    }
}*/

