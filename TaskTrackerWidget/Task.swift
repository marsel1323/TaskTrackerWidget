//
//  Task.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import Foundation

struct Task: Identifiable {
    let id: UUID
    let name: String
    let link: URL!
    let timeSpent: TimeInterval
    let timeGiven: TimeInterval
    let status: TaskStatus
    // var progress: [TaskProgress]
    
    enum TaskStatus: String {
        case completed
        case notCompleted
    }
}

let sampleTasks: [Task] = [
    Task(
        id: UUID(),
        name: "Practice typing in keybr",
        link: URL(string: "https://www.keybr.com/"),
        timeSpent: 5 * 60,
        timeGiven: 20 * 60,
        status: .notCompleted
    ),
    Task(
        id: UUID(),
        name: "Read a book",
        link: nil,
        timeSpent: 10 * 60,
        timeGiven: 30 * 60,
        status: .completed
    ),
    Task(
        id: UUID(),
        name: "Workout",
        link: nil,
        timeSpent: 40 * 60,
        timeGiven: 60 * 60,
        status: .notCompleted
    )

]
