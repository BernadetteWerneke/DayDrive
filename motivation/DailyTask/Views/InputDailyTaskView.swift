//
//  InputDailyTaskView.swift
//  motivation
//
//  Created by Bernadette Werneke on 10.08.23.
//

import SwiftUI

struct InputDailyTaskView: View {
    var body: some View {
        TimeCard()
        WaterCard()
        StepCard()
    }
}

struct InputDailyTaskView_Previews: PreviewProvider {
    static var previews: some View {
        InputDailyTaskView()
    }
}
