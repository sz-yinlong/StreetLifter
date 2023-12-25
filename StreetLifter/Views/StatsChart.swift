import Charts
import SwiftUI

struct StatsChart: View {
    var trainingSessions: [TrainingSession]
    var days = 7

    
    var body: some View {
        VStack {
            Chart {
                ForEach(trainingSessions, id: \.date) { session in
                    BarMark(x: .value("Date", session.date),
                            y: .value("Total reps", session.totalReps))
                    .annotation {
                        Text("\(session.totalReps)")
                            .font(.caption)
                    }
                }
            }
         .chartScrollableAxes(.horizontal)
           .chartXVisibleDomain(length: days)
        }
    }
}
struct StatsChartPreview: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(TrainingSessionsManager())
       
    }
}
