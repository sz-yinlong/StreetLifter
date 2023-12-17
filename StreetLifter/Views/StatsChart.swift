import Charts
import SwiftUI

struct StatsChart: View {
    var trainingSessions: [TrainingSession]

    var body: some View {
        VStack {
            Text("Statistcic")
            Chart {
                ForEach(trainingSessions, id: \.date) { session in
                    BarMark(x: .value("Date", session.date),
                            y: .value("Total reps", session.totalReps))
                }
            }
        }
    }
}
