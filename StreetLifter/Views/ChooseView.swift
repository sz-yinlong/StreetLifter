import SwiftUI

struct ChooseView: View {
    // MARK: - Properties
    @ObservedObject var pullupsViewmodel: PullupsTrainingViewModel
    @ObservedObject var dipsViewModel: DipsTrainingViewModel
    @ObservedObject var storage = TrainingSessionStorage()


    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                GroupBox() {
                    VStack {
                        Text(R.string.localizable.pullups())
                        BarChart(trainingSessions: pullupsViewmodel.trainingSessions)
                    }
                    VStack {
                        Text(R.string.localizable.dips())
                        BarChart(trainingSessions: dipsViewModel.trainingSessions)
                    }
                }
                Spacer()
                chooseExerciseText
                exerciseButton(destination: PullupsExerciseView(), image: R.image.pullUps.name, title: R.string.localizable.pullups())
                    .standardExerciseButtonStyle()
                exerciseButton(destination: DipsExerciseView(), image: R.image.dips.name, title: R.string.localizable.dips())
                    .standardExerciseButtonStyle()
            }
            .padding(.horizontal, 10)
        }
        .navigationBarHidden(true)
    }

    // MARK: - Subviews
    private var previousTrainingView: some View {
        VStack(alignment: .leading, spacing: 50) {
            Text(R.string.localizable.previousSession())
                .font(.title)
                .fontWeight(.medium)
            VStack {
                previousTrainingColumn(title: R.string.localizable.pullups(), lastTotalReps: pullupsViewmodel.lastSessionTotalReps)
                previousTrainingColumn(title: R.string.localizable.dips(), lastTotalReps: dipsViewModel.lastSessionTotalReps)
            }
        }
        .padding()
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 10)
    }

    private var chooseExerciseText: some View {
        Text(R.string.localizable.exercise())
            .font(.body)
            .fontWeight(.light)
            .padding(.top)
        
    }

    private func previousTrainingColumn(title: String, lastTotalReps: Int?) -> some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .frame(width: 100, alignment: .leading)
            
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
                .background(Color.black.opacity(1))
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
            .padding()
            .background(Color.white)
            .cornerRadius(12)
    }
}

// MARK: - Previews
struct ChooseView_Previews: PreviewProvider {
    static var previews: some View {
        let storage = TrainingSessionStorage()
        let pullupsVM = PullupsTrainingViewModel(storage: storage)
        let dipsVM = DipsTrainingViewModel(storage: storage)

        ChooseView(pullupsViewmodel: pullupsVM, dipsViewModel: dipsVM)
    }
}
