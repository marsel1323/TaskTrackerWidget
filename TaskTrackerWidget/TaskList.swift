//
//  TaskList.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import SwiftUI

struct TaskList: View {
    var tasks: [Task]
    @Binding var selectedTask: Task?
    @Binding var showDetail: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(tasks) { task in
                    TaskRow(task: task, selectedTask: $selectedTask, showDetail: $showDetail)
                }
            }
            .padding(.bottom)
        }
    }
}
