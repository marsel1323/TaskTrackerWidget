//
//  TaskDetailView.swift
//  TaskTrackerWidget
//
//  Created by Марсель on 25.03.2023.
//

import SwiftUI
import AVFoundation

struct TaskDetailView: View {
    var task: Task
    @Binding var showDetail: Bool
    @State private var timer: Timer? = nil
    @State private var remainingTime: TimeInterval
    @State private var isRunning: Bool = false
    
    init(task: Task, showDetail: Binding<Bool>) {
        self.task = task
        _showDetail = showDetail
        _remainingTime = State(
            initialValue: task.timeGiven < Constants.maxTimeGiven
                ? task.timeGiven
                : Constants.maxTimeGiven
        )
    }

    var body: some View {
        VStack {
            HeaderView(task: task, showDetail: $showDetail)
            
            TimerPicker(remainingTime: $remainingTime)
                .padding(.bottom, 30)
            
            RemainingTimeText(remainingTime: $remainingTime)
            
            TimerControlButton(isRunning: $isRunning, remainingTime: $remainingTime)
                .padding(.top, 30)
            
            Spacer()
            
        }
        .padding(.top, 30)
    }
}

struct HeaderView: View {
    var task: Task
    @Binding var showDetail: Bool
    
    var body: some View {
        HStack {
            BackButton(showDetail: $showDetail)
            
            Spacer()
            
            TaskNameText(task: task)
            
            Spacer()
        }
    }
}

struct BackButton: View {
    @Binding var showDetail: Bool
    
    var body: some View {
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
        .background(Capsule().fill(Constants.buttonColor))
        .buttonStyle(PlainButtonStyle())
        .padding(.leading)
        .padding(.top)
    }
}

struct TaskNameText: View {
    var task: Task
    
    var body: some View {
        Text(task.name)
            .font(.largeTitle)
            .padding()
            .foregroundColor(Constants.buttonColor)
    }
}

struct RemainingTimeText: View {
    @Binding var remainingTime: TimeInterval
    
    let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
    var body: some View {
        Text(formatter.string(from: TimeInterval(remainingTime)) ?? "")
            .font(.system(size: 60, weight: .bold, design: .rounded))
            .foregroundColor(Constants.buttonColor)
    }
}

struct TimerControlButton: View {
    @Binding var isRunning: Bool
    @Binding var remainingTime: TimeInterval
    @State private var timer: Timer? = nil
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        Button(action: toggleTimer) {
            Text(isRunning ? "Stop" : "Start")
                .font(.title)
                .padding()
                .background(Capsule().fill(Constants.buttonColor))
                .foregroundColor(.white)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "sound", withExtension: "mp3") else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Failed to play sound: \(error.localizedDescription)")
        }
    }
    
    func toggleTimer() {
        if isRunning {
            timer?.invalidate()
        } else {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if remainingTime > 0 {
                    remainingTime -= 1
                } else {
                    playSound()
                    timer?.invalidate()
                    isRunning = false
                }
            }
            //RunLoop.current.add(timer, forMode: .common)
            //self.timer = timer
        }
        isRunning.toggle()
    }
}

struct TimerPicker: View {
    @Binding var remainingTime: TimeInterval
    
    private var minutes: Binding<Int> {
        Binding(
            get: { Int(remainingTime / 60) },
            set: { newValue in remainingTime = TimeInterval(newValue * 60 + Int(remainingTime) % 60) }
        )
    }
    
    var body: some View {
        HStack {
            Text("Set timer:")
                .font(.headline)
                .padding(.trailing)
            
            Picker("", selection: minutes) {
                ForEach(0..<60) { minute in
                    Text("\(minute) min")
                        .font(.system(size: 18))
                }
            }
            .frame(width: 150)
            .clipped()
            .pickerStyle(DefaultPickerStyle())
            .labelsHidden()
            .padding(.trailing, 24)

        }
        .padding(.horizontal)
    }
}
