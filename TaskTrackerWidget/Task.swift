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
    
    enum TaskStatus: String, Codable {
        case completed
        case notCompleted
    }
}

extension Task: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case link
        case timeSpent
        case timeGiven
        case status
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        link = try container.decode(URL.self, forKey: .link)
        timeSpent = try container.decode(TimeInterval.self, forKey: .timeSpent)
        timeGiven = try container.decode(TimeInterval.self, forKey: .timeGiven)
        status = try container.decode(TaskStatus.self, forKey: .status)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(link, forKey: .link)
        try container.encode(timeSpent, forKey: .timeSpent)
        try container.encode(timeGiven, forKey: .timeGiven)
        try container.encode(status, forKey: .status)
    }
}
