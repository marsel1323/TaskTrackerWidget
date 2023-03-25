//
//  TaskDetailView.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import SwiftUI

struct TaskDetailView: View {
    var task: Task
    @Binding var showDetail: Bool

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    showDetail = false
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)

                        Text("Back")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(Capsule().fill(Color.blue))
                .buttonStyle(PlainButtonStyle())
                .padding(.leading)
                .padding(.top)

                Spacer()
            }

            Text(task.name)
                .font(.largeTitle)
                .padding()

            Spacer()
        }
    }
}
