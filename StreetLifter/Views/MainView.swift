

import SwiftUI

struct MainView: View {
    @EnvironmentObject var trainingSessionManager: TrainingSessionsManager
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .foregroundStyle(LinearGradient(colors: [.red, .orange.opacity(0.5), Color.secondary.opacity(0.1)], startPoint: .top, endPoint: .bottom))
                        .padding(EdgeInsets(top: geo.size.height * 0.0, leading: 0, bottom: geo.size.height * 0.125, trailing: 0))
                        .ignoresSafeArea()
                    Text("Training")
                        .font(.title)
                        .fontWeight(.bold)
                        .position(x: geo.size.width * 0.13, y: geo.size.height * 0.035)
                        .padding(EdgeInsets(top: 0, leading: 11, bottom: 0, trailing: 0))
                    RoundedRectangle(cornerRadius: 10.0)
                        .foregroundStyle(.white)
                        .padding(EdgeInsets(top: geo.size.height * 0.17, leading: 10, bottom: geo.size.height * 0.5, trailing: 10))
                        .ignoresSafeArea()
                    
                    MainChart(pullupsTrainingSession: trainingSessionManager.pullupsViewModel.trainingSessions, dipsTrainingSession: trainingSessionManager.dipsViewModel.trainingSessions)
                        .padding(EdgeInsets(top: geo.size.height * 0.10, leading: 15, bottom: geo.size.height * 0.4, trailing: 15))
                }
                
                VStack {
                    exerciseButton(destination: PullupsTrainingView(),
                                   title: R.string.localizable.pullups(), circleColor: ColorConstants.bitterSweet,
                                   reps: trainingSessionManager.pullupsViewModel.lastSessionTotalReps ?? 0,
                                   weight: trainingSessionManager.pullupsViewModel.weight)
                    exerciseButton(destination: DipsTrainingView(),
                                   title: R.string.localizable.dips(), circleColor: ColorConstants.robinEggBlue,
                                   reps: trainingSessionManager.dipsViewModel.lastSessionTotalReps ?? 0,
                                   weight: trainingSessionManager.dipsViewModel.weight)
                }
                .padding(EdgeInsets(top: geo.size.height * 0.72, leading: 10, bottom: geo.size.height * 0.0, trailing: 10))
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

    func exerciseButton<Destination: View>(destination: Destination, title: String, circleColor: Color, reps: Int, weight: Int) -> some View {
        NavigationLink(destination: destination) {
            VStack(alignment: .leading) {
                HStack {
                    HStack {
                        Image(systemName: "aqi.medium")
                            .foregroundStyle(circleColor)
                            .font(.subheadline)
                        Text(title)
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                        .font(.title3)
                        .offset(x: -10, y: 30)
                }
                VStack(alignment: .leading) {
                    Text("Last session:")
                        .font(.callout)
                        .foregroundStyle(.tertiary)
                    
                    HStack(spacing: 5) {
                        Text("\(reps)")
                            .foregroundStyle(.primary)
                        Text("reps")
                            .foregroundStyle(.secondary)
                        Text("~\(weight)")
                            .foregroundStyle(.primary)
                        Text("Kg")
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
            }
            .padding(EdgeInsets(top: 6, leading: 15, bottom: 8, trailing: 10))
          
            .background(.white)
            .cornerRadius(10)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    TabBar()
}

enum Constants {
    static let sessionDateWidth = CGFloat(80)
    static let sessionSpacing = CGFloat(4)
    static let sessionVStackWidth = CGFloat(28)
    static let sessionVPaddingVertical = CGFloat(2)
    static let sessionVPaddingHorizontal = CGFloat(8)
    static let sessionVCornerRadius = CGFloat(8)
    static let sessionHAlignmentGuide = CGFloat(275)
    static let buttonMaxWidth = CGFloat(350)
    static let buttonMaxHeight = CGFloat(120)
    static let buttonCornerRadius = CGFloat(10)
    static let fontPrimary = CGFloat(10)
    static let fontSecondary = CGFloat(8)
    static let fontDate = CGFloat(12)
    static let opacity = CGFloat(0.1)
}
