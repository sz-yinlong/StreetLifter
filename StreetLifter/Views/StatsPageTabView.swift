import SwiftUI

struct StatsPageTabView: View {
    @EnvironmentObject var trainingSessionsManager: TrainingSessionsManager
    @State private var selectedSegment = 0
    private let exerciseArray = ["Pullups", "Dips"]

    var body: some View {
        VStack {
            Picker("Picker", selection: $selectedSegment) {
                ForEach(0..<exerciseArray.count, id: \.self) { index in
                    Text(exerciseArray[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            TabView(selection: $selectedSegment) {
                StatsView(trainingSessions: trainingSessionsManager.pullupsViewModel.trainingSessions, chartColor: Constants.bitterSweet)
                    .tag(0)
                    .navigationTitle(R.string.localizable.pullups())

                StatsView(trainingSessions: trainingSessionsManager.dipsViewModel.trainingSessions, chartColor: Constants.robinEggBlue)
                    .tag(1)
                    .navigationTitle(R.string.localizable.dips())
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Скрыть индикаторы страниц
        }
    }
}
