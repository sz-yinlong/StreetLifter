
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
        s 
    }
    
    var body: some View
    {
        
        Group {
            if showNextView {
                ChooseView(viewModel: pullupsViewModel)
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
//                    Just(true)
//                        .delay(for: .seconds(3),
//                               scheduler: DispatchQueue.main)
//                        .sink { _ in
//                            showNextView = true
//                        }
//                       .store(in: &cancellable)
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

