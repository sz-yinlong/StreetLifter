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
    let numberOfDisplayDays = 5
    
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
                NavigationLink("See all", destination: StatsPageTabView())
                    .font(.subheadline)
                    .foregroundStyle(.blue)
                    .offset(x: -3, y: 7)
            }
            .padding(EdgeInsets(top: 5, leading: 1, bottom: 0, trailing: 1))
           
            Text(R.string.localizable.lastSevenSessions())
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(EdgeInsets(top: 0, leading: 1, bottom: 2, trailing: 1))
         
            Chart {
                ForEach(combinedSessions, id: \.date) { session in
                    LineMark(
                        x: .value("Date", session.date),
                        y: .value("Total Reps", session.totalReps)
                    )
                    .foregroundStyle(by: .value("Session Type", session.sessionType))
                    .interpolationMethod(.monotone)

                    PointMark(
                        x: .value("Date", session.date),
                        y: .value("total Reps", session.totalReps)
                    )
                    .foregroundStyle(by: .value("SessionType", session.sessionType))
                }
            }
            .chartYScale(range: .plotDimension(padding: 30))
           
            
//            ./*chartXVisibleDomain(length: 3600 * 24 * numberOfDisplayDays)*/
            .padding(EdgeInsets(top: 10, leading: 5, bottom: 5, trailing: 5))
            .chartLegend(.hidden)
           

            .chartForegroundStyleScale([
                "Pullups": Constants.bitterSweet,
                "Dips": Constants.robinEggBlue
            ])
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
    }
}

struct CHART_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(TrainingSessionsManager())
       
    }
}
