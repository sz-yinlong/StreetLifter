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
        //        HStack {
        //            VStack(alignment: .leading) { // Установка выравнивания по левому краю и интервала между элементами
        //                Text("Streak")
        //                    .font(.headline)
        //            }
        
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
            }
        }
        
        .padding(.vertical, 5)
        .padding(.horizontal, 5)
        .background(.white, in: RoundedRectangle(cornerRadius: 20))
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
