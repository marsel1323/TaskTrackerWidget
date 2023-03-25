//
//  TaskMeasurement.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import Foundation

struct TaskMeasurement: Identifiable, Codable {
    let id = UUID()
    let taskID: UUID
    let date: Date
    let elapsedTime: TimeInterval
}
