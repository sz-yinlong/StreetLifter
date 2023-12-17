

import SwiftUI

struct DipsTrainingView: View {
    @EnvironmentObject var trainingSessionsManager: TrainingSessionsManager

    var body: some View {
        BaseTrainingView<BaseTrainingViewModel, Any>(viewModel: trainingSessionsManager.dipsViewModel, backgroundColor: ColorConstants.robinEggBlue.opacity(1))
            .toolbar(.hidden, for: .tabBar)
            .navigationTitle(R.string.localizable.dips())
    }
}
