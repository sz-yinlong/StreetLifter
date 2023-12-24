
import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView() {
            MainView()
                .tabItem {
                    Label("Training", systemImage: "house")
                }
          TrainingProgram()
                .tabItem {
                    Label("Program", systemImage: "line.3.horizontal")
                }
        }
        .accentColor(Constants.buttonColor)
    }
}

//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBar()
//            .environmentObject(TrainingSessionsManager())
//    }
//}
