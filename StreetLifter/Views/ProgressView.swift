import SwiftUI
import Charts

struct CombinedTrainingSession {
    let pullups: [TrainingSession]
    let dips: [TrainingSession]
}


struct BarChart: View {
    var combinedSessions: CombinedTrainingSession
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(R.string.localizable.previousSession())
                .font(.subheadline)
            Text("Last 7 sessions")
                .font(.caption)
                .foregroundStyle(.secondary)
            Chart {
                ForEach(Array(combinedSessions.pullups.suffix(7).enumerated()), id: \.element) { _ , pullupSession in
                    BarMark(
                        x: .value("Date", pullupSession.date),
                        y: .value("Total Reps", pullupSession.totalReps)
                    )
                    .foregroundStyle(ColorConstants.bitterSweet)
                    .cornerRadius(3)
                }
                ForEach(Array(combinedSessions.dips.suffix(7).enumerated()), id: \.element) { index, dipSession in
                    BarMark(
                        x: .value("Date", dipSession.date),
                        y: .value("Total Reps", dipSession.totalReps)
                    )
                    .foregroundStyle(ColorConstants.robinEggBlue)
                    .cornerRadius(3)
                }
            }
            .chartForegroundStyleScale(["Pull-ups": ColorConstants.bitterSweet, "Dips": ColorConstants.robinEggBlue])
            .frame(width: 250, height: 200)
            .padding([.horizontal, .vertical], 10) // Добавляете отступы вокруг графика
            .background(.white)
            .cornerRadius(10)
        }
    }
}

// MARK: - Previews
struct ChooseView_Previews: PreviewProvider {
    static var previews: some View {
        let storage = TrainingSessionStorage()
        let pullupsVM = PullupsTrainingViewModel(storage: storage)
        let dipsVM = DipsTrainingViewModel(storage: storage)
        
        ChooseView(pullupsViewmodel: pullupsVM, dipsViewModel: dipsVM)
    }
}
