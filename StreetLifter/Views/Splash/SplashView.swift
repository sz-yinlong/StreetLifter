
import SwiftUI
import Combine

struct SplashView: View {
    
    @State private var showNextView = true
    
    private var cancellable: Set<AnyCancellable> = []
    private let storage = TrainingSessionStorage()

    
    var body: some View
    {
        Group {
            if showNextView {
               TabBar()
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { showNextView = true
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
