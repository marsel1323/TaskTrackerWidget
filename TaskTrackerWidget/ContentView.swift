//
//  ContentView.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentDate: Date = Date()
    @State private var tasks: [Task] = sampleTasks
    @State private var selectedTask: Task? = nil
    @State private var showDetail: Bool = false

    var body: some View {
        ZStack {
            if !showDetail {
                VStack {
                    DateNavigation(currentDate: $currentDate)
                    
                    TaskList(tasks: tasks, selectedTask: $selectedTask, showDetail: $showDetail)
                        .padding(.top)
                }
                .padding()
                .onAppear {
                    currentDate = Date()
                }
                
            } else {
                TaskDetailView(task: selectedTask!, showDetail: $showDetail)
            }
        }
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


