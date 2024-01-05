//
//  StreakView.swift
//  StreetLifter
//
//  Created by Artem on 24.12.2023.
//

import SwiftUI

struct StreakView: View {
    @State private var workoutDays: [WorkoutDay] = [
        WorkoutDay(day: R.string.localizable.mon(), isCompleted: true),
        WorkoutDay(day: R.string.localizable.tue(), isCompleted: false),
        WorkoutDay(day: R.string.localizable.wed(), isCompleted: true),
        WorkoutDay(day: R.string.localizable.thu(), isCompleted: false),
        WorkoutDay(day: R.string.localizable.fri(), isCompleted: true),
        WorkoutDay(day: R.string.localizable.sat(), isCompleted: false),
        WorkoutDay(day: R.string.localizable.sun(), isCompleted: false),
    ]
    var body: some View {

        HStack(spacing: 8) {
            ForEach($workoutDays, id: \.day) { $day in
                RoundedRectangle(cornerRadius: 15)
                    .fill(day.isCompleted ? Constants.acidGreen : Color.secondary.opacity(0.2))
                    .aspectRatio(1, contentMode: .fit)
                    .overlay(
                        Text(day.day)
                            .font(.footnote)
                    )
                
                    .onTapGesture {
                        day.isCompleted.toggle()
                      
                    }
                    .animation(.bouncy, value: day.isCompleted)
                    .sensoryFeedback(.success, trigger: day.isCompleted)
            }
        }
        
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .background(Material.thin, in: RoundedRectangle(cornerRadius: 20))
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
