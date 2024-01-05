

import SwiftUI

struct MainView: View {
    @EnvironmentObject var trainingSessionManager: TrainingSessionsManager
    @State private var selectedWeek: Int = 0

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text(R.string.localizable.training())
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 16)
                        
                    Spacer()
                }
                .padding(.top, 16)
                StreakView()
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                
                MainChart(pullupsTrainingSession: trainingSessionManager.pullupsViewModel.trainingSessions, dipsTrainingSession: trainingSessionManager.dipsViewModel.trainingSessions)
                    .padding(EdgeInsets(top: 80, leading: 16, bottom: 8, trailing: 16))
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
            .padding(.bottom, 16)
            .padding(.top, 0)
        }
        .background(Constants.trainingBackgroundGradient.ignoresSafeArea(.all))
        .accentColor(Constants.buttonColor)
        .navigationBarBackButtonHidden()
        .fontDesign(.rounded)
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
                    Text(title)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                }
                .padding(.vertical, 10)
                .padding(.leading, 16)
                Spacer()
            
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
                    .font(.title3)
                    .offset(x: -10, y: 28)
            }
          
            VStack(alignment: .leading) {
                Text(R.string.localizable.lastSession())
                    .font(.callout)
                    .foregroundStyle(.tertiary)
                    
                HStack(spacing: 5) {
                    Text("\(reps)")
                        .foregroundStyle(.black)
                        .font(.title3)
                     
                    Text(R.string.localizable.repsCaps())
                        .foregroundStyle(.secondary)
                        .offset(y: 0.3)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 5, trailing: 0))
        }
        .background(.white)
        .cornerRadius(20)
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(TrainingSessionsManager())
    }
}
