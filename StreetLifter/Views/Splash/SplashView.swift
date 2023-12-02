
import SwiftUI
import Combine

struct SplashView: View {
    
    @State private var showNextView = false
    
    private var cancellable: Set<AnyCancellable> = []
    private let storage = TrainingSessionStorage()
    private let pullupsViewModel: PullupsTrainingViewModel
    private let dipsViewModel: DipsTrainingViewModel
    
    init() {
        self.pullupsViewModel = PullupsTrainingViewModel(storage: storage)
        self.dipsViewModel = DipsTrainingViewModel(storage: storage)
    }
    
    var body: some View
    {
        Group {
            if showNextView {
                ChooseView(pullupsViewmodel: pullupsViewModel
                           , dipsViewModel: dipsViewModel)
            } else {
                VStack {
                    Text("STREETLIFTER")
                        .font(.system(size: 30))
                        .padding()
                    
                    
                    Image(systemName: "medal")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                .padding()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { showNextView = true
                    }
                }
            }
        }
    }
    
    struct SplashView_Previews: PreviewProvider {
        static var previews: some View {
            SplashView()
        }
    }
}
