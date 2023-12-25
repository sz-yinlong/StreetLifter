

import SwiftUI

struct MainView: View {
    @EnvironmentObject var trainingSessionManager: TrainingSessionsManager
    @State private var selectedWeek: Int = 0
    @State private var trainingProgram = ["Level 1", "Level 2", "Level 3"]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Training")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 16)
                        
                    Spacer()
                }
                .padding(.top, 16)
                StreakView()
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                
                MainChart(pullupsTrainingSession: trainingSessionManager.pullupsViewModel.trainingSessions, dipsTrainingSession: trainingSessionManager.dipsViewModel.trainingSessions)
                    .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
                    
            }
    
            VStack(spacing: 8) {
                exerciseButton(destination: PullupsTrainingView(),
                               title: R.string.localizable.pullups(), circleColor: Constants.bitterSweet,
                               reps: trainingSessionManager.pullupsViewModel.lastSessionTotalReps ?? 0)
                exerciseButton(destination: DipsTrainingView(),
                               
                               title: R.string.localizable.dips(), circleColor: Constants.robinEggBlue,
                               reps: trainingSessionManager.dipsViewModel.lastSessionTotalReps ?? 0)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 10)
        }
        .background(Constants.trainingBackgroundGradient.ignoresSafeArea(.all))
        .accentColor(Constants.buttonColor)
        .navigationBarBackButtonHidden()
       
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

func exerciseButton<Destination: View>(destination: Destination, title: String, circleColor: Color, reps: Int) -> some View {
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
                    .offset(x: -10, y: 25)
            }
            .padding(.bottom, 1)
            VStack(alignment: .leading) {
                Text("Last session:")
                    .font(.callout)
                    .foregroundStyle(.tertiary)
                    
                HStack(spacing: 5) {
                    Text("\(reps)")
                        .foregroundStyle(.primary)
                        
                    Text("reps")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(15)
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(TrainingSessionsManager())
    }
}
