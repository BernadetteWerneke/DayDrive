//
//  Date*extension.swift
//  motivation
//
//  Created by Bernadette Werneke on 21.07.23.
//
//  Dieser Codepart des "DateHeaders" mit dazugehörigen Files im Ordner "extensions" ist aus einem youtube-Video entnommen:
//  https://www.youtube.com/watch?v=sbheMzA3jTI&t=1097s
//  SwiftUI - Task Management App - SwiftData - Complex UI - Xcode 15 - SwiftUI Tutorials - Pt 1 von Kavsoft
//  https://www.youtube.com/watch?v=x-LqfOui2-I&t=0s
//  SwiftUI - Task Management App - SwiftData - Complex UI - Xcode 15 - SwiftUI Tutorials - Pt 2
//

import SwiftUI


extension Date {
    //Stundenaktualisierung
   /* static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }*/
    
    //String-Formatierung
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    //check whether the date is today
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }

    
    //fetching week based on given date
    func fetchWeek(_ date: Date = .init()) -> [WeekDay] {
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: date)
        
        var week: [WeekDay] = []
        let weekForDate = calendar.dateInterval(of: .weekOfMonth, for: startOfDate)
        guard let startOfWeek = weekForDate?.start else {
            return []
        }
        
        //iteration to get the full week
        (0..<7).forEach { index in      //already fetched the current week´s start date, so easily find the week dates just by using this iteration method
            if let weekDay = calendar.date(byAdding: .day, value: index, to: startOfDate) {
                week.append(.init(date: weekDay))
            }
        }
        return week
    }
    
    //creating next week, based on the last current week´s date
    func createNextWeek() -> [WeekDay] {
        let calendar = Calendar.current
        let startOfLastDate = calendar.startOfDay(for: self)
        guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startOfLastDate) else {
            return []
        }
        return fetchWeek(nextDate)
    }
    
    //creating previous week, based on the first current week´s date
    func createPreviousWeek() -> [WeekDay] {
        let calendar = Calendar.current
        let startOfFirstDate = calendar.startOfDay(for: self)
        guard let previousDate = calendar.date(byAdding: .day, value: -7, to: startOfFirstDate) else { //7 Tage zurück anfügen
            return []
        }
        return fetchWeek(previousDate)
    }
    
    
    struct WeekDay: Identifiable {
        var id: UUID = .init()
        var date: Date
    }
}
