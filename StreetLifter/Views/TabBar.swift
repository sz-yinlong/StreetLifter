
import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView() {
            MainView()
                .tabItem {
                    Label("Training", systemImage: "medal.fill")
                }
          TrainingProgram()
                .tabItem {
                    Label("Program", systemImage: "line.3.horizontal")
                }
        }
       
    }
}

//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBar()
//            .environmentObject(TrainingSessionsManager())
//    }
//}
