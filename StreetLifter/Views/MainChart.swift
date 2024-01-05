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

    @EnvironmentObject var trainingSessionManager: TrainingSessionsManager

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
            }
            .padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 16))
            Chart {
                ForEach(combinedSessions, id: \.date) { session in
                    BarMark(
                        x: .value("Date", session.date),
                        y: .value("Total Reps", session.totalReps)
                    )
                    .cornerRadius(3)
                    .foregroundStyle(by: .value("Session Type", session.sessionType))
                    .symbol(by: .value("Total Reps", session.sessionType))
                    .position(by: .value("Session Type", session.sessionType))
                
                }
            }
            .chartScrollableAxes(.horizontal)
            .chartXVisibleDomain(length: 7)
            .chartYScale(type: .linear)
            .chartYScale(range: .plotDimension())
            .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
            .chartLegend(.hidden)
            .chartForegroundStyleScale([
                "Pullups": Constants.bitterSweet,
                "Dips": Constants.robinEggBlue
            ])
        }
        .background(.white)
        .cornerRadius(15)
    }
}

struct CHART_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(TrainingSessionsManager())
    }
}
