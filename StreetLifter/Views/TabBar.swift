
import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView() {
            MainView()
                .tabItem {
                    Label("Main", systemImage: "medal.fill")
                }
           Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
       
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(TrainingSessionsManager())
    }
}
