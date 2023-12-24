//
//  StreakView.swift
//  StreetLifter
//
//  Created by Artem on 24.12.2023.
//

import SwiftUI

struct StreakView: View {
    @State private var workoutDays: [WorkoutDay] = [
        WorkoutDay(day: "Mon", isCompleted: true),
        WorkoutDay(day: "Tue", isCompleted: false),
        WorkoutDay(day: "Wed", isCompleted: true),
        WorkoutDay(day: "Thu", isCompleted: false),
        WorkoutDay(day: "Fri", isCompleted: true),
        WorkoutDay(day: "Sat", isCompleted: false),
        WorkoutDay(day: "Sun", isCompleted: false),
    ]
    var body: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 35.0)
                    .fill(.white.opacity(0.9))
                    .padding(EdgeInsets(top: geo.size.height * 0.31, leading: 0, bottom: geo.size.height * 0.36, trailing: 0))
                HStack(spacing: 8) {
                    ForEach($workoutDays, id: \.day) { $day in
                        Circle()
                            .fill(day.isCompleted ? Constants.acidGreen : Color.secondary.opacity(0.3))
                            .padding(.horizontal, 1)
                            .frame(width: geo.size.width * 0.12)
                            .overlay(
                                Text(day.day)
                                    .font(.footnote)
                                    .fontWeight(.light)
                            )

                            .onTapGesture {
                                day.isCompleted.toggle()
                            }
                            .animation(.bouncy, value: day.isCompleted)
                    }
                }
                Text("Streak")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                    .position(x: geo.size.width * 0.45, y: geo.size.height * 0.36)
                    .padding(EdgeInsets(top: 0, leading: 11, bottom: 0, trailing: 0))
            }
        }
    }
}

#Preview {
    TabBar()
        .environmentObject(TrainingSessionsManager())
}

struct WorkoutDay {
    let day: String
    var isCompleted: Bool
}
