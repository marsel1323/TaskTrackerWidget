//
//  NewTaskView.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import SwiftUI

struct NewTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    @State private var taskName: String = ""
    @State private var link: String = ""
    @State private var timeGiven: TimeInterval = Constants.maxTimeGiven
    
    var body: some View {
        VStack {
            TextField("Task name", text: $taskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.top)
                .padding(.horizontal)
            
            TextField("Link", text: $link)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom)
                .padding(.horizontal)
            
            TimerPicker(remainingTime: $timeGiven)
                .padding(.bottom, 30)
            
            Button(action: {
                let newTask = Task(
                    id: UUID(),
                    name: taskName,
                    link: URL(string: "\(link)"),
                    timeSpent: 0,
                    timeGiven: timeGiven,
                    status: Task.TaskStatus.notCompleted
                )
                taskViewModel.tasks.append(newTask)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Add Task")
                    .font(.title)
                    .padding()
                    .background(Capsule().fill(Color.accentColor))
                    .foregroundColor(Color.primary)
            }
            .buttonStyle(PlainButtonStyle())
            .padding()
            
            Spacer()
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}
