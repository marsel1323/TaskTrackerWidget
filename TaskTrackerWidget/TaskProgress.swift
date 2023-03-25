//
//  TaskProgress.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import Foundation

struct TaskProgress: Identifiable {
    let id: UUID
    let taskId: UUID
    let date: Date
    var timeSpent: TimeInterval
}
