import SwiftUI

struct BaseExerciseView<TrainingViewModel: BaseTrainingViewModel>: View {
  
    @StateObject private var viewModel: TrainingViewModel
    
    init(viewModel: TrainingViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header:
                                HStack {
                        Spacer()
                        Text("Previous sessions")
                        Spacer()
                    }
                    )
                    {
                        ForEach(viewModel.trainingSessions, id: \.self) { session in
                            HStack(spacing: 5) {
                                Text(session.date)
                                Spacer()
                                ForEach(session.reps, id: \.self) { reps in
                                    Text("\(reps)")
                                        .font(.system(size: 14))
                                        .padding(.vertical, 4)
                                        .padding(.horizontal, 8)
                                        .frame(width: 40)
                                        .background(Color.secondary.opacity(0.1))
                                        .cornerRadius(8)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                
                VStack {
                    if let exerciseType = viewModel.trainingViewType() {
                        
                        NavigationLink(destination: destinationView(for: exerciseType)) {
                            Color.primary
                                .frame(maxWidth: 300)
                                .frame(maxHeight: 50)
                                .cornerRadius(10)
                                .overlay(
                                    Text("Start Exercise")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                )
                        }
                    } else {
                        
                    }
                }
            }
        }
    }
    
    
    private func destinationView(for exerciseType: ExerciseType) -> some View {
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
}

struct BaseExcerciseView_Previews: PreviewProvider {
    static var previews: some View {
        let storage = TrainingSessionStorage()
        let viewModel = DipsTrainingViewModel(storage: storage)
        BaseExerciseView(viewModel: viewModel)
    }
}
