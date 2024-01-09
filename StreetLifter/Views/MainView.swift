

import SwiftUI

struct MainView: View {
    @EnvironmentObject var trainingSessionManager: TrainingSessionsManager
    @State private var selectedWeek: Int = 0
    @State private var today = Date()

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    // MARK: Date & Headline

                    VStack(alignment: .leading, spacing: 5) {
                        Text(Self.dateFormatter.string(from: today))
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                        Text(R.string.localizable.training())
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                .padding(.leading, 16)
                .padding(.top, 16)

                // MARK: - Streak

                StreakView()
                    .padding(.horizontal, 16)

                // MARK: - Chart

                MainChart(
                    pullupsTrainingSession: trainingSessionManager.pullupsViewModel.trainingSessions,
                    dipsTrainingSession: trainingSessionManager.dipsViewModel.trainingSessions
                )
                .padding(EdgeInsets(top: 40, leading: 16, bottom: 40, trailing: 16))
            }

            // MARK: - Exercises

            VStack(spacing: 8) {
                exerciseButton(
                    destination: PullupsTrainingView(),
                    title: R.string.localizable.pullups(), circleColor: Constants.bitterSweet,
                    reps: trainingSessionManager.pullupsViewModel.lastSessionTotalReps ?? 0
                )
                exerciseButton(
                    destination: DipsTrainingView(),
                    title: R.string.localizable.dips(), circleColor: Constants.robinEggBlue,
                    reps: trainingSessionManager.dipsViewModel.lastSessionTotalReps ?? 0
                )
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            .padding(.top, 0)
        }
        .background(Constants.trainingBackgroundGradient.ignoresSafeArea(.all))
        .accentColor(.secondary)
        .navigationBarBackButtonHidden()
    }
}

// MARK: - Methods

func destinationView(for exerciseType: ExerciseType) -> some View {
    AnyView(
        Group {
            switch exerciseType {
            case .pullups:
                PullupsTrainingView()
            case .dips:
                DipsTrainingView()
            }
        }
    )
}

// MARK: - Extensons

extension MainView {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(TrainingSessionsManager())
    }
}
