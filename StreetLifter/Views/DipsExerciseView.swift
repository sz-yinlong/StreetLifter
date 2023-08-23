
import SwiftUI


struct DipsExerciseView: View {
    var body: some View {
        BaseExerciseView(viewModel: DipsTrainingViewModel())
    }
}

struct DipsViewPreviews: PreviewProvider {
    static var previews: some View {
        PullupsExerciseView()
    }
}
