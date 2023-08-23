
import SwiftUI
import Combine

struct SplashView: View {
    
    @State private var showNextView = false
     private var cancellable: Set<AnyCancellable> = []
    
    var body: some View
    {
        
        Group {
            if showNextView {
                ChooseView()
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

