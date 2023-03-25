//
//  TaskRow.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import SwiftUI

struct TaskRow: View {
    var task: Task
    @Binding var selectedTask: Task?
    @Binding var showDetail: Bool
    @Binding var currentDate: Date
    
    // let taskProgress = getTaskProgressForCurrentDate(task: task)
    
    var body: some View {
        Button(action: {
            selectedTask = task
            showDetail = true
        }) {
            HStack {
                Text(task.name)
                    .font(.headline)
                
                Spacer()
                
                Text("\(formatTimeInterval(task.timeSpent)) / \(formatTimeInterval(task.timeGiven))")
                    .font(.footnote)
                
            }
            .padding(.vertical)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.accentColor)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            .padding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    func formatTimeInterval(_ interval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval(interval)) ?? ""
    }
    
//    func getTaskProgressForCurrentDate(task: Task) -> TaskProgress? {
//        let currentDate = Calendar.current.startOfDay(for: currentDate)
//        return task.progress.first { taskProgress in
//            let taskProgressDay = Calendar.current.startOfDay(for: taskProgress.date)
//            return currentDate == taskProgressDay
//        }
//    }
}
