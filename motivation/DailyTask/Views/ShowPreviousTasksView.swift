//
//  ShowPreviousTasksView.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.08.23.
//

import SwiftUI

struct ShowPreviousTasksView: View {
    //@Binding var currentDate: Date
    
    var body: some View {
        
        VStack{
            TimeShowCard()
            WaterShowCard()
            StepShowCard()
        }
        
    }
}

struct ShowPreviousTasksView_Previews: PreviewProvider {
    static var previews: some View {
        ShowPreviousTasksView()
    }
}
