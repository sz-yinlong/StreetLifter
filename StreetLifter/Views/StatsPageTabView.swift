import SwiftUI

struct StatsPageTabView: View {
    @EnvironmentObject var trainingSessionsManager: TrainingSessionsManager
    @Environment(\.dismiss) var dismiss
    @State private var selectedSegment = 0

    private let exerciseArray = [
        R.string.localizable.pullups(), R.string.localizable.dips()]

    var body: some View {
        VStack {
            Picker("Picker", selection: $selectedSegment) {
                ForEach(0 ..< exerciseArray.count, id: \.self) { index in
                    Text(exerciseArray[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            TabView(selection: $selectedSegment) {
                StatsView(
                    trainingSessions: trainingSessionsManager.pullupsViewModel.trainingSessions,
                    chartColor: Constants.bitterSweet
                )
                    .tag(0)
                    .navigationTitle(R.string.localizable.pullups())
                    .foregroundStyle(Color.primary)

                StatsView(trainingSessions: trainingSessionsManager.dipsViewModel.trainingSessions, 
                          chartColor: Constants.robinEggBlue
                )
                    .tag(1)
                    .navigationTitle(R.string.localizable.dips())
                    .foregroundStyle(Color.primary)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .navigationBarBackButtonHidden(true)
        }
    }
}
