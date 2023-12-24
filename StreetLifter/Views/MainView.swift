

import SwiftUI

struct MainView: View {
    @EnvironmentObject var trainingSessionManager: TrainingSessionsManager
    @State private var selectedWeek: Int = 0
    @State private var trainingProgram = ["Level 1", "Level 2", "Level 3"]

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    
                      
                    RoundedRectangle(cornerRadius: 20.0)
                        .foregroundStyle(LinearGradient(colors: [.red, .orange.opacity(0.5), Color.secondary.opacity(0.1)], startPoint: .top, endPoint: .bottom))
                        .padding(EdgeInsets(top: geo.size.height * 0.0, leading: 0, bottom: geo.size.height * 0, trailing: 0))
                        .ignoresSafeArea()
                    Text("Training")
                        .font(.title)
                        .fontWeight(.bold)
                        .position(x: geo.size.width * 0.14, y: geo.size.height * 0.06)
                        .padding(EdgeInsets(top: 0, leading: 11, bottom: 0, trailing: 0))
                    
  
         
                    RoundedRectangle(cornerRadius: 20.0)
                        .foregroundStyle(.white)
                        .padding(EdgeInsets(top: geo.size.height * 0.37, leading: 10, bottom: geo.size.height * 0.42, trailing: 10))
                        .ignoresSafeArea()
                   
                    MainChart(pullupsTrainingSession: trainingSessionManager.pullupsViewModel.trainingSessions, dipsTrainingSession: trainingSessionManager.dipsViewModel.trainingSessions)
                        .padding(EdgeInsets(top: geo.size.height * 0.3, leading: 15, bottom: geo.size.height * 0.3, trailing: 15))
                    StreakView()
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: geo.size.height * 0.58, trailing: 10))
                }
        
              
                VStack {
                    
                    exerciseButton(destination: PullupsTrainingView(),
                                   title: R.string.localizable.pullups(), circleColor: Constants.bitterSweet,
                                   reps: trainingSessionManager.pullupsViewModel.lastSessionTotalReps ?? 0,
                                   weight: trainingSessionManager.pullupsViewModel.weight)
                    exerciseButton(destination: DipsTrainingView(),
                                   
                                   title: R.string.localizable.dips(), circleColor: Constants.robinEggBlue,
                                   reps: trainingSessionManager.dipsViewModel.lastSessionTotalReps ?? 0,
                                   weight: trainingSessionManager.dipsViewModel.weight)
                }
                .padding(EdgeInsets(top: geo.size.height * 0.73, leading: 10, bottom: geo.size.height * 0.0, trailing: 10))
            }
        }
        .accentColor(Constants.buttonColor)
        .navigationBarBackButtonHidden()
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
            .padding(EdgeInsets(top: 5, leading: 15, bottom: 8, trailing: 10))
          
            .background(.white)
            .cornerRadius(20)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(TrainingSessionsManager())
    }
}
