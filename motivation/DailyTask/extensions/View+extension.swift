//
//  View+extension.swift
//  motivation
//
//  Created by Bernadette Werneke on 21.07.23.
//

import SwiftUI

//custom view extensions
extension View {
    
    //check two dates are same
    func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
