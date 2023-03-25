//
//  ContentView.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentDate: Date = Date()
    @State private var selectedTask: Task? = nil
    @State private var showDetail: Bool = false
    @ObservedObject var taskViewModel = TaskViewModel()
    @State private var showNewTaskView = false

    var body: some View {
        ZStack {
            if !showDetail {
                VStack {
                    DateNavigation(currentDate: $currentDate)
                    
                    TaskList(tasks: taskViewModel.tasks, selectedTask: $selectedTask, showDetail: $showDetail, currentDate: $currentDate)
                        .padding(.top)
                    
                }
                .padding()
                .onAppear {
                    currentDate = Date()
                }
                .toolbar {
                    Button(action: {
                        showNewTaskView.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showNewTaskView) {
                    NewTaskView()
                        .environmentObject(taskViewModel)
                }
                
            } else {
                TaskDetailView(task: selectedTask!, showDetail: $showDetail)
                    .environmentObject(taskViewModel)
            }
        }
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


