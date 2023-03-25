//
//  TaskTrackerWidgetApp.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import SwiftUI

@main
struct TaskTrackerWidgetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TaskViewModel())
        }
    }
}
