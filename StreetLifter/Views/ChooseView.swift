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
                exerciseButton(destination: PullupsExerciseView(), image: "pull-ups", title: R.string.localizable.pullups())
                    .standardExerciseButtonStyle()
                exerciseButton(destination: DipsExerciseView(), image: "dips", title: R.string.localizable.dips)
                    .standardExerciseButtonStyle()
            }
            .padding(.horizontal, 10)
        }
        .navigationBarHidden(true)
    }

    // MARK: - Subviews
    private var previousTrainingView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Previous Session")
                .font(.headline)
                .fontWeight(.medium)
            VStack {
                previousTrainingColumn(title: "Pull-ups:", lastTotalReps: pullupsViewmodel.lastSessionTotalReps)
                previousTrainingColumn(title: "Dips:", lastTotalReps: dipsViewModel.lastSessionTotalReps)
            }
        }
        .padding()
        .frame(width: .infinity, height: 100)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 10)
    }

    private var chooseExerciseText: some View {
        Text("Exercise")
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
                Text("Reps")
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
