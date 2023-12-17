import Charts
import SwiftUI

struct CombinedTrainingSession {
    var date: String
    var totalReps: Int
    var sessionType: String // "Pullups" или "Dips"
}

struct MainChart: View {
    var pullupsTrainingSession: [TrainingSession]?
    var dipsTrainingSession: [TrainingSession]?

    var combinedSessions: [CombinedTrainingSession] {
        var sessions = [CombinedTrainingSession]()
        if let pullupsSessions = pullupsTrainingSession {
            sessions += pullupsSessions.map { CombinedTrainingSession(date: $0.date, totalReps: $0.totalReps, sessionType: "Pullups") }
        }
        if let dipsSessions = dipsTrainingSession {
            sessions += dipsSessions.map { CombinedTrainingSession(date: $0.date, totalReps: $0.totalReps, sessionType: "Dips") }
        }
        return sessions
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(R.string.localizable.progress())
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                Spacer()
                NavigationLink("See all", destination: StatsPageTabView())
                    .font(.footnote)
                    .foregroundStyle(.blue)
                    .offset(x: -3, y: 7)
            }
           
            Text(R.string.localizable.lastSevenSessions())
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Chart {
                ForEach(combinedSessions, id: \.date) { session in
                    LineMark(
                        x: .value("Date", session.date),
                        y: .value("Total Reps", session.totalReps)
                    )
                    .foregroundStyle(by: .value("Session Type", session.sessionType))
                    .interpolationMethod(.catmullRom)

                    PointMark(
                        x: .value("Date", session.date),
                        y: .value("total Reps", session.totalReps)
                    )
                    .foregroundStyle(by: .value("SessionType", session.sessionType))
                }
            }
           
            .chartLegend(.hidden)
            .chartYAxis {
                AxisMarks(position: .trailing, values: .automatic(desiredCount: 5))
            }

            .chartForegroundStyleScale([
                "Pullups": ColorConstants.bitterSweet,
                "Dips": ColorConstants.robinEggBlue
            ])
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
    }
}

#Preview {
    TabBar()
}

