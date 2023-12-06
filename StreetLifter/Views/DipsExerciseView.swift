
import SwiftUI

struct DipsExerciseView: View {
    
    let viewModel: DipsTrainingViewModel
    
    init() {
        let storage = TrainingSessionStorage()
        self.viewModel = DipsTrainingViewModel(storage: storage)
    }
    var body: some View {
        NavigationStack {
            VStack {
                Text(R.string.localizable.dips())
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                BaseExerciseView(viewModel: viewModel)
                
            }
        }
    }
}

struct DipsViewPreviews: PreviewProvider {
    static var previews: some View {
        DipsExerciseView()
    }
}
