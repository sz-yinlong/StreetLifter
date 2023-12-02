import SwiftUI
import Charts

struct BarChart: View {
    var trainingSessions: [TrainingSession]

    var body: some View {
        Chart {
            ForEach(Array(trainingSessions.suffix(7).enumerated()), id: \.element) { index, session in
                BarMark(
                    x: .value("Session", index),
                    y: .value("Total Reps", session.totalReps)
                )
                PointMark(
                    x: .value("Session", index),
                    y: .value("Total Reps", session.totalReps)
                )
                .foregroundStyle(by: .value("Total Reps", index))
                .interpolationMethod(.catmullRom)
            
                
                
                
                // Использование аннотации для отображения значения повторений
                .annotation(position: .top, alignment: .center) {
                    Text("\(session.totalReps)")
                        .font(.caption)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(20)
                }
                .cornerRadius(20)
            }
        }
        .chartXAxis {
            AxisMarks(preset: .aligned, position: .bottom)
        }
        .chartYAxis {
            AxisMarks(preset: .aligned, position: .leading)
        }
        .frame(width: 300, height: 180) // Задаете желаемый размер графика
        .padding([.horizontal, .vertical], 10) // Добавляете отступы вокруг графика
               .background(RoundedRectangle(cornerRadius: 20) // Создаете закругленный прямоугольник
                               .fill(Color.white) // Задаете цвет фона
                               .shadow(radius: 10))
    }
}
