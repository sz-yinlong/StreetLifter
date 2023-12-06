
import SwiftUI


struct PullupsExerciseView: View {
    
    let viewModel: PullupsTrainingViewModel
    
    init() {
        let storage = TrainingSessionStorage()
        self.viewModel = PullupsTrainingViewModel(storage: storage)
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(R.string.localizable.pullups())
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                BaseExerciseView(viewModel: viewModel)
                
            }
        }
    }
}

struct PullupsViewPreviews: PreviewProvider {
    static var previews: some View {
        PullupsExerciseView()
        
    }
}
