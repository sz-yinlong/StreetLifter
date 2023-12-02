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
                                    .frame(width: Constants.sessionDateWidth, alignment: .leading)
                                Spacer()

                                HStack(alignment: .top, spacing: Constants.sessionSpacing) {
                                    ForEach(Array(zip(session.reps, session.weight)), id: \.0) { reps, weight in
                                        VStack {
                                            Text("\(reps)")
                                                .font(.system(size: Constants.fontPrimary))
                                                .fontWeight(.medium)
                                                .frame(alignment: .leading)
                                            Text("\(weight) kg")
                                                .font(.system(size: Constants.fontSecondary))
                                                .foregroundColor(.secondary)
                                        }
                                        .frame(width: Constants.sessionVStackWidth)
                                        .padding(.vertical, Constants.sessionVPaddingVertical)
                                        .padding(.horizontal, Constants.sessionVPaddingHorizontal)
                                        .background(Color.secondary.opacity(Constants.opacity))
                                        .cornerRadius(Constants.sessionVCornerRadius)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.vertical, Constants.sessionVPaddingVertical)
                        }
                    }
                    .listSectionSeparator(.hidden)
                    .alignmentGuide(.listRowSeparatorTrailing) { _ in Constants.sessionHAlignmentGuide }
                }
                .listStyle(.plain)
                
                VStack {
                    if let exerciseType = viewModel.trainingViewType() {
                        NavigationLink(destination: destinationView(for: exerciseType)) {
                            Color.primary
                                .frame(maxWidth: Constants.buttonMaxWidth)
                                .frame(maxHeight: Constants.buttonMaxHeight)
                                .cornerRadius(Constants.buttonCornerRadius)
                                .overlay(
                                    Text("Start Exercise")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                )
                        }
                    } else {
                        // Обработка для других случаев
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

struct BaseExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        let storage = TrainingSessionStorage()
        let viewModel = DipsTrainingViewModel(storage: storage)
        BaseExerciseView(viewModel: viewModel)
    }
}

struct Constants {
    static let sessionDateWidth = CGFloat(80)
    static let sessionSpacing = CGFloat(4)
    static let sessionVStackWidth = CGFloat(34)
    static let sessionVPaddingVertical = CGFloat(4)
    static let sessionVPaddingHorizontal = CGFloat(8)
    static let sessionVCornerRadius = CGFloat(8)
    static let sessionHAlignmentGuide = CGFloat(350)
    static let buttonMaxWidth = CGFloat(300)
    static let buttonMaxHeight = CGFloat(50)
    static let buttonCornerRadius = CGFloat(10)
    static let fontPrimary = CGFloat(16)
    static let fontSecondary = CGFloat(12)
    static let opacity = CGFloat(0.1)
}
