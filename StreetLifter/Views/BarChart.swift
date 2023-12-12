import SwiftUI
import Charts

struct BarChart: View {
    var pullupsTrainingSession: [TrainingSession]?
    var dipsTrainingSession: [TrainingSession]?

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(R.string.localizable.progress())
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                Spacer()
                Button("See All") { }
                    .font(.footnote)
                    .foregroundStyle(.blue)
            }

            Text(R.string.localizable.lastSevenSessions())
                .font(.subheadline)
                .foregroundStyle(.secondary)

            if let pullupsTrainingSession = pullupsTrainingSession,
               let dipsTrainingSession = dipsTrainingSession {
                // Display lines for pull-ups training sessions
                Chart {
                    ForEach(Array(pullupsTrainingSession.suffix(7).enumerated()), id: \.element) { index, session in
                        LineMark(
                            x: .value("Date", session.date),
                            y: .value("Total Reps", session.totalReps))
                    }
                    .foregroundStyle(ColorConstants.chartOrange)
                    .interpolationMethod(.monotone)
                }
                
                // Display lines for dips training sessions
                Chart {
                    ForEach(Array(dipsTrainingSession.suffix(7).enumerated()), id: \.element) { index, session in
                        LineMark(
                            x: .value("Date", session.date),
                            y: .value("Total Reps", session.totalReps))
                    }
                    .foregroundStyle(.blue) // You can set a different color for dips
                    .interpolationMethod(.monotone)
                }
            } else {
                // Handle the case where either pullupsTrainingSession or dipsTrainingSession is nil,
                // e.g., show a placeholder or empty state.
                Text("No training sessions available")
            }
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
    }
}



#Preview {
    TabBar()
}
