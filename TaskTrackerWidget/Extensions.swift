//
//  Extensions.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import Foundation

extension TimeInterval {
    func formattedInterval() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropLeading
        return formatter.string(from: self) ?? ""
    }
}
