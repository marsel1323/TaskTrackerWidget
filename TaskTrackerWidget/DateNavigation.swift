//
//  DateNavigation.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import SwiftUI

struct DateNavigation: View {
    @Binding var currentDate: Date
    
    var body: some View {
        HStack {
            Button(action: {
                changeDate(by: -1)
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Capsule().fill(Constants.buttonColor))
            }
            .contentShape(Rectangle())
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Text(verbatim: dateFormatter.string(from: currentDate))
                .font(.largeTitle)
                .frame(width: 300, alignment: .center)
                .padding()
            
            Spacer()
            
            Button(action: {
                changeDate(by: 1)
            }) {
                HStack {
                    Image(systemName: "arrow.right")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Capsule().fill(Constants.buttonColor))
            }
            .contentShape(Rectangle())
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    func changeDate(by days: Int) {
        let secondsPerDay = 86400.0
        currentDate = currentDate.addingTimeInterval(Double(days) * secondsPerDay)
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .full
    return formatter
}()
