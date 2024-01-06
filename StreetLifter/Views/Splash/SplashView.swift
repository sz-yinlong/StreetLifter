//import SwiftUI
//import Combine
//
//struct SplashView: View {
//    @State private var showNextView = false
//
//    private var cancellable: Set<AnyCancellable> = []
//    private let storage = TrainingSessionStorage()
//
//    var body: some View {
//        Group {
//            if showNextView {
//               TabBar()
//            } else {
//                VStack {
//                    Text("STREETLIFTER")
//                        .font(.system(size: 30))
//                        .padding()
//                        .foregroundColor(Color.primary)
//
//                    Image(systemName: "medal")
//                        .imageScale(.large)
//                        .foregroundColor(Color.primary)
//                }
//                .padding()
//                .onAppear {
//                    if !UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
//                        UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                            self.showNextView = true
//                        }
//                    } else {
//                        self.showNextView = true
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct SplashView_Previews: PreviewProvider {
//    static var previews: some View {
//        SplashView().environmentObject(TrainingSessionsManager())
//    }
//}
