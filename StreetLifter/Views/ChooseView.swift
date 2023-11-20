import SwiftUI

struct ChooseView: View {
    // MARK: - Properties
    @ObservedObject var pullupsViewmodel: PullupsTrainingViewModel
    @ObservedObject var dipsViewModel: DipsTrainingViewModel

    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                previousTrainingView
                Spacer()
                chooseExerciseText
                exerciseButton(destination: PullupsExerciseView(), image: "pull-ups", title: "Pull-ups")
                    .standardExerciseButtonStyle()
                exerciseButton(destination: DipsExerciseView(), image: "dips", title: "Dips")
                    .standardExerciseButtonStyle()
            }
            .padding(.horizontal, 10)
        }
        .navigationBarHidden(true)
    }

    // MARK: - Subviews
    private var previousTrainingView: some View {
        VStack(alignment: .center, spacing: 40) {
            Text("Previous Training")
                .font(.headline)
            HStack {
                previousTrainingColumn(title: "Pullups", lastTotalReps: pullupsViewmodel.lastSessionTotalReps, weight: "~20kg")
                previousTrainingColumn(title: "Dips", lastTotalReps: dipsViewModel.lastSessionTotalReps, weight: "~25kg")
            }
        }
        .padding()
        .frame(width: .infinity, height: 150)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 10)
        .padding(.top)
    }

    private var chooseExerciseText: some View {
        Text("Choose your Exercise")
            .font(.headline)
            .fontWeight(.regular)
            .padding(.bottom)
    }

    private func previousTrainingColumn(title: String, lastTotalReps: Int?, weight: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
            if let lastTotalReps = lastTotalReps {
                Text("Reps: \(lastTotalReps)")
            } else {
                Text("Reps")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Text("Weight: \(weight)")
                .font(.subheadline)
                .foregroundColor(.secondary)
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
