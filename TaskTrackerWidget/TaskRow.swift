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
            .background(Color.white)
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
}
