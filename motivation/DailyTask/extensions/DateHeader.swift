//
//  DateHeader.swift
//  motivation
//
//  Created by Bernadette Werneke on 21.07.23.
//

import SwiftUI

//Anzeige der einzelnen Tage
struct DateHeader: View {
    
    @State private var currentDate: Date = .init()
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 1
    @EnvironmentObject var authService: FBAuthService
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 5) {
                //1. Zeile: Titel und Logout-Button
                Text("Daily Tasks")
                
                Spacer()
                
                Button {
                    authService.signOut()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                        .font(.largeTitle)
                }
            }
            .font(.title.bold())
            
            //2. Zeile: Wochentag + Datum
            Text(currentDate.formatted(date: .complete, time: .omitted)) //create a string with a full date and no time representation: Sunday, January 17, 2021
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            
            //3. Zeile: weekSlider
            TabView(selection: $currentWeekIndex) {
                ForEach(weekSlider.indices, id: \.self) {index in
                    let week = weekSlider[index]
                    WeekView(week)
                        .padding(.horizontal, 15)  //*** Zeilenabstand der Datumsleiste
                        .tag(index)
                }
            }
            .padding(.horizontal, -15) //*** Zeilenabstand der Datumsleiste
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 90)
        
            
        }
        .padding(15) //für 1. und 2. Zeile
        .onAppear (perform: {
            if weekSlider.isEmpty {
                let currentWeek = Date().fetchWeek()
                //logic of pagination: when generating the initial week, then generate one set of previous and next week data too. Thus, in the initial, is an array such as [previous, current, next]. When the page reaches either the previous or next page from the initial page, fetch more appropiate dates.
                
                if let firstDate = currentWeek.first?.date {
                    weekSlider.append(firstDate.createPreviousWeek())
                }
                weekSlider.append(currentWeek)
                
                if let lastDate = currentWeek.last?.date {
                    weekSlider.append(lastDate.createNextWeek())
                }
            }
        })
        }
                   
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay]) -> some View {
        HStack(spacing: 0){
            ForEach(week) { day in
                VStack(spacing: 8) {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                       // .foregroundColor(.gray)
                    
                    
                    Text(day.date.format("dd"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(isSameDate(day.date, currentDate) ? .white : .black)
                        .frame(width: 35, height: 35)
                        .background(content: {
                            if isSameDate(day.date, currentDate) {
                                Circle()
                                    .fill(.yellow)
                            }
                        })
                        .background(
                        Circle()
                            .stroke(.gray))
                }
                .padding(.horizontal, 8)
                .onTapGesture {
                    //updating current date
                    withAnimation {
                        currentDate = day.date
                    }
                }
            }
        }
    }
}

struct DateHeader_Previews: PreviewProvider {
    static var previews: some View {
        DateHeader()
    }
}
