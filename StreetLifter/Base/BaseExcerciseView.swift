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
//            GeometryReader { geo in
//                
//            
//            RoundedRectangle(cornerRadius: 10.0)
//                    .foregroundStyle(.gray.opacity(0.2))
//                    .padding(EdgeInsets(top: geo.size.height * 0.41, leading: 9, bottom: geo.size.height * 0.432, trailing: 9))
//                .ignoresSafeArea()
//                            }
            NavigationStack {
                VStack {
                    if showChart {
                        BarChart(trainingSession: viewModel.trainingSessions)
                    }
                    Spacer()
                    GeometryReader { geo in
                        VStack {
                            List {
                            header: do {
                                    Text(R.string.localizable.trainingHistory())
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    
                                }
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
                            .padding(.top)
                            .padding([.leading, .trailing], geo.size.width * -0.03)
                            
                            
                        }
                    }
                    VStack {
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
    
    
     func destinationView(for exerciseType: ExerciseType) -> some View {
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
    static let sessionHAlignmentGuide = CGFloat(275)
    static let buttonMaxWidth = CGFloat(44)
    static let buttonMaxHeight = CGFloat(50)
    static let buttonCornerRadius = CGFloat(10)
    static let fontPrimary = CGFloat(10)
    static let fontSecondary = CGFloat(8)
    static let fontDate = CGFloat(12)
    static let opacity = CGFloat(0.1)
}
