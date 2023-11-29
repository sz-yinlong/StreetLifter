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
                        Section(header: Text("Previous sessions")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .center)
                        ) {
                            ForEach(viewModel.trainingSessions, id: \.self) { session in
                                HStack {
                                    Text(session.date)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .frame(width: 80, alignment: .leading) 
                                    Spacer()

                                    HStack(alignment: .top, spacing: 4) {
                                        ForEach(Array(zip(session.reps, session.weight)), id: \.0) { reps, weight in
                                            VStack {
                                                Text("\(reps)")
                                                    .font(.system(size: 16))
                                                    .fontWeight(.medium)
                                                    .frame(alignment: .leading)
                                                Text("\(weight) kg")
                                                    .font(.system(size: 12))
                                                    .foregroundColor(.secondary)
                                            }
                                            .frame(width: 34)
                                            .padding(.vertical, 4)
                                            .padding(.horizontal, 8)
                                            .background(Color.secondary.opacity(0.1))
                                            .cornerRadius(8)
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        .listSectionSeparator(.hidden)
                        .alignmentGuide(.listRowSeparatorTrailing) { viewDimensions in
                                            return 350
                                        }
                    }
                    .listStyle(.plain)
                    
                
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
