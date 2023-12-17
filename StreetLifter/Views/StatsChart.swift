import Charts
import SwiftUI

struct StatsChart: View {
    var trainingSessions: [TrainingSession]

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
        }
    }
}
