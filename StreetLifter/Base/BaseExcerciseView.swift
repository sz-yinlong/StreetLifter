import SwiftUI

struct BaseExerciseView<TrainingViewModel: BaseTrainingViewModel>: View {
    @StateObject private var viewModel: TrainingViewModel
    @State private var showChart: Bool = true
    
    init(viewModel: TrainingViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        showChart = viewModel.shouldDisplayChart()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.red, Color.white]), startPoint: .top, endPoint: .bottom)
                            )
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 400, trailing: 0))
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundStyle(.white)
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 544, trailing: 15))
            NavigationStack {
                VStack {
                    if showChart {
                        BarChart(trainingSession: viewModel.trainingSessions)
                    }
                    Spacer()
                    Text(R.string.localizable.trainingHistory())
                        .font(.subheadline)
                        .foregroundStyle(ColorConstants.buttonColor.opacity(0.7))
                    GeometryReader { geometry in
                        Divider()
                            .frame(width: geometry.size.width * 0.9)
                            .overlay(ColorConstants.buttonColor.opacity(0.5))
                    }
                    
                    GeometryReader { geo in
                        VStack {
                            List {
                                ForEach(viewModel.trainingSessions, id: \.self) { session in
                                    HStack {
                                        Text(session.date)
                                            .font(.system(size: Constants.fontDate))
                                            .foregroundColor(.secondary)
                                        Spacer()
                                        HStack(alignment: .top, spacing: Constants.sessionSpacing) {
                                            ForEach(Array(zip(session.reps, session.weight)), id: \.0) { reps, weight in
                                                VStack {
                                                    Text("\(reps)")
                                                        .font(.system(size: Constants.fontPrimary))
                                                        .fontWeight(.medium)
                                                    
                                                    Divider()
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
                                    }
                                    
                                }
                                .listSectionSeparator(.hidden)
                                .alignmentGuide(.listRowSeparatorTrailing) { _ in Constants.sessionHAlignmentGuide }
                            }
                            .listStyle(.insetGrouped)
                            .padding([.leading, .trailing], geo.size.width * 0.05)
                            .background(.pink)
                            .scrollContentBackground(.hidden)
                        }
                    }
                    VStack {
                        Spacer()
                        if let exerciseType = viewModel.trainingViewType() {
                            NavigationLink(destination: destinationView(for: exerciseType)) {
                                ColorConstants.buttonColor
                                    .frame(maxWidth: Constants.buttonMaxWidth)
                                    .frame(maxHeight: Constants.buttonMaxHeight)
                                    .cornerRadius(Constants.buttonCornerRadius)
                                    .overlay(
                                        Text(R.string.localizable.start())
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

#Preview {
   TabBar()
}

private struct Constants {
    static let sessionDateWidth = CGFloat(80)
    static let sessionSpacing = CGFloat(4)
    static let sessionVStackWidth = CGFloat(28)
    static let sessionVPaddingVertical = CGFloat(2)
    static let sessionVPaddingHorizontal = CGFloat(8)
    static let sessionVCornerRadius = CGFloat(8)
    static let sessionHAlignmentGuide = CGFloat(350)
    static let buttonMaxWidth = CGFloat(350)
    static let buttonMaxHeight = CGFloat(50)
    static let buttonCornerRadius = CGFloat(10)
    static let fontPrimary = CGFloat(12)
    static let fontSecondary = CGFloat(10)
    static let fontDate = CGFloat(14)
    static let opacity = CGFloat(0.1)
}
