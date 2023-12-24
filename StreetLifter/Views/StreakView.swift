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
                RoundedRectangle(cornerRadius: 20.0)
                    .fill(.white)
                    .padding(EdgeInsets(top: geo.size.height * 0.26, leading: 0, bottom: geo.size.height * 0.39, trailing: 0))
                
                HStack(spacing: 8) {
                    ForEach($workoutDays, id: \.day) { $day in
                        Circle()
                            .fill(day.isCompleted ? Constants.acidGreen : Color.secondary.opacity(0.2))
                            .padding(.horizontal, 1)
                            .frame(width: geo.size.width * 0.113)
                        
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
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0))
             
                VStack(alignment: .leading) { // Установка выравнивания по левому краю и интервала между элементами
                    Text("Streak")
                        .font(.headline)
                        
                                
                    Text("Tap training days")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                                
                }
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 100, trailing: 0))
                .frame(width: geo.size.width, height: geo.size.height * 0.1, alignment: .leading)
               
                
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

struct CustomShape: Shape {
    let radius: CGFloat = 16.0
    
    private let padding: CGFloat = 26
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .zero)
        
        path.addLine(to: CGPoint(x: rect.midX - padding - radius, y: rect.minY))
        
        path.addQuadCurve(to: CGPoint(x: rect.midX - padding, y: rect.minY + radius),
                          control: CGPoint(x: rect.midX - padding, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.midX - padding,
                                 y: rect.minY + padding - radius))
        
        path.addQuadCurve(to: CGPoint(x: rect.midX - padding + radius,
                                      y: rect.minY + padding),
                          control: CGPoint(x: rect.midX - padding,
                                           y: rect.minY + padding))
        
        path.addLine(to: CGPoint(x: rect.midX + padding - radius,
                                 y: rect.minY + padding))
        
        path.addQuadCurve(to: CGPoint(x: rect.midX + padding,
                                      y: rect.minY + padding - radius),
                          control: CGPoint(x: rect.midX + padding, y: rect.minY + padding))
        
        path.addLine(to: CGPoint(x: rect.midX + padding,
                                 y: rect.minY + radius))
                
        path.addQuadCurve(to: CGPoint(x: rect.midX + padding + radius, y: rect.minY),
                          control: CGPoint(x: rect.midX + padding, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
    
        return path
    }
}
