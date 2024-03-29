import Charts
import SwiftUI

struct MainChart: View {
    @EnvironmentObject var trainingSessionManager: TrainingSessionsManager

    var pullupsTrainingSession: [TrainingSession]?
    var dipsTrainingSession: [TrainingSession]?

    // MARK: - Computed properties

    var combinedSessions: [CombinedTrainingSession] {
        var sessions = [CombinedTrainingSession]()
        if let pullupsSessions = pullupsTrainingSession {
            sessions += pullupsSessions.map { CombinedTrainingSession(
                date: $0.date,
                totalReps: $0.totalReps,
                sessionType: "Pullups")
            }
        }
        if let dipsSessions = dipsTrainingSession {
            sessions += dipsSessions.map { CombinedTrainingSession(
                date: $0.date,
                totalReps: $0.totalReps,
                sessionType: "Dips") }
        }
        return sessions
    }
    
    var chartPlaceholder: some View {
        VStack {
            Spacer()
            Text(R.string.localizable.noData())
                .font(.title2)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            Spacer() 
        }
        .frame(maxWidth: .infinity, minHeight: 200)
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
    }


    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(R.string.localizable.progress())
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.primary)
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 16))
            
            // MARK: - Chart
            if combinedSessions.isEmpty {
              chartPlaceholder
            }
            else {
                Chart {
                    ForEach(combinedSessions, id: \.date) { session in
                        BarMark(
                            x: .value("Date", session.date),
                            y: .value("Total Reps", session.totalReps))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
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
        }
        .background(Color(.systemGray6))
        .cornerRadius(20)
    }
}

// MARK: - Preview

struct CHART_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(TrainingSessionsManager())
    }
}
