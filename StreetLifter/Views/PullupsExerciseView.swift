
import SwiftUI


struct PullupsExerciseView: View {
    var body: some View {
        BaseExerciseView(viewModel: PullupsTrainingViewModel())
    }
}

struct PullupsViewPreviews: PreviewProvider {
    static var previews: some View {
        PullupsExerciseView()
    }
}
