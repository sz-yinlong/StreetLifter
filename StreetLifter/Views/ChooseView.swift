import SwiftUI

struct ChooseView: View {
    // MARK: - Properties
    @ObservedObject var pullupsViewmodel: PullupsTrainingViewModel
    @ObservedObject var dipsViewModel: DipsTrainingViewModel
    @ObservedObject var storage = TrainingSessionStorage()
    
    
    // MARK: - Body
    var body: some View {
        
        NavigationStack {
            Text("StreetLifter")
                .font(.headline)
            Spacer()
            ZStack {
                Rectangle()
                    .fill(Color(red: 58 / 255, green: 80 / 255, blue: 190 / 255, opacity: 0.05))
                    .cornerRadius(20)
                    .frame(width: 300, height: 280)
                HStack {
                    BarChart(combinedSessions: CombinedTrainingSession(pullups: pullupsViewmodel.trainingSessions, dips: dipsViewModel.trainingSessions))
                }
            }
            Spacer()
            
            VStack {
                exerciseButton(destination: PullupsExerciseView(), image: R.image.pullUps.name, title: R.string.localizable.pullups())
                    .standardExerciseButtonStyle()
                exerciseButton(destination: DipsExerciseView(), image: R.image.dips.name, title: R.string.localizable.dips())
                    .standardExerciseButtonStyle()
            }
            
            .padding(.horizontal, 10)
            
            
        }
    }
    
    private func previousTrainingColumn(title: String, lastTotalReps: Int?) -> some View {
        HStack {
            Text(title)
                .font(.subheadline)
            
            
            if let lastTotalReps = lastTotalReps {
                Text("\(lastTotalReps)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            } else {
                Text(R.string.localizable.reps())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    private func exerciseButton<Destination: View>(destination: Destination, image: String, title: String) -> some View {
        NavigationLink(destination: destination) {
            VStack(alignment: .leading) {
                HStack {
                    Image(image)
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(ColorConstants.buttonColor)
                .cornerRadius(12)
                .navigationBarBackButtonHidden(true)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - View Modifiers
extension View {
    func standardExerciseButtonStyle() -> some View {
        self
            .cornerRadius(8)
            .frame(width: 350, height: 70)
    }
}

// MARK: - Previews
struct ChooseView2_Previews: PreviewProvider {
    static var previews: some View {
        let storage = TrainingSessionStorage()
        let pullupsVM = PullupsTrainingViewModel(storage: storage)
        let dipsVM = DipsTrainingViewModel(storage: storage)
        
        ChooseView(pullupsViewmodel: pullupsVM, dipsViewModel: dipsVM)
    }
}
