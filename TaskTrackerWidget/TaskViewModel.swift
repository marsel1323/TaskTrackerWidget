//
//  TaskViewModel.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [
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
    @Published var taskMeasurements: [TaskMeasurement] = []
}
