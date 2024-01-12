//
//  StreakView.swift
//  StreetLifter
//
//  Created by Artem on 24.12.2023.
//

import SwiftUI

import SwiftUI

struct StreakView: View {
    
    let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d" // Формат только для числа дня
        return formatter
    }()

    // Предполагаем, что у вас есть массив тренировочных сессий, который вы получаете из внешнего источника
    var trainingSessions: [TrainingSession]
    
    var leadingSpaces: Int {
            let weekday = Calendar.current.component(.weekday, from: days.first ?? Date())
            return (weekday + 5) % 7 // Делаем воскресенье (1) днем с индексом 6, понедельник (2) - с индексом 0 и так далее
        }
    
    // Генерируем массив дат для года, который мы хотим отобразить
    let days: [Date] = DateManager.generateDatesForCurrentMonth()
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.fixed(25)), count: 7), spacing: 8) {
            ForEach(0..<leadingSpaces, id: \.self) { _ in
                Color.clear.frame(width: 20, height: 20)
            }
            ForEach(days, id: \.self) { day in
                RoundedRectangle(cornerRadius: 4)
                    .fill(isTrainingDay(day) ? Constants.acidGreen : Color.secondary.opacity(0.2))
                    .aspectRatio(1, contentMode: .fit)
                    .overlay(
                        Text(day, formatter: dayFormatter)
                            .font(.footnote)
                            .foregroundStyle(Color.primary)
                    )
            }
        }
        .padding(8)
    }
    
    // Проверяем, является ли переданная дата днем тренировки
    func isTrainingDay(_ date: Date) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d" // Указываем формат даты, который совпадает с форматом в объектах TrainingSession
        return trainingSessions.contains(where: { session in
            dateFormatter.date(from: session.date) == date
        })
    }
}

#Preview {
    TabBar()
        .environmentObject(TrainingSessionsManager())
}

