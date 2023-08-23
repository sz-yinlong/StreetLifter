import SwiftUI

struct DipsTrainingView: View {
    @StateObject private var viewModel = DipsTrainingViewModel()
    
    var body: some View {
        BaseTrainingView<DipsTrainingViewModel, Any>(viewModel: viewModel)
            .navigationBarBackButtonHidden()
    }

    struct DipsTrainingView_Previews: PreviewProvider {
        static var previews: some View {
            DipsTrainingView()
        }
    }
}
