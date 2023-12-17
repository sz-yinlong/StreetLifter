

import SwiftUI

struct PullupsTrainingView: View {
    @EnvironmentObject var trainingSessionsManager: TrainingSessionsManager

    var body: some View {
        BaseTrainingView<BaseTrainingViewModel, Any>(viewModel: trainingSessionsManager.pullupsViewModel, backgroundColor: ColorConstants.robinEggBlue.opacity(1))
            .toolbar(.hidden, for: .tabBar)
            .navigationTitle(R.string.localizable.pullups())
    }
}
