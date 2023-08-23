import SwiftUI

struct PullupsTrainingView: View {
    
    @StateObject private var viewModel = PullupsTrainingViewModel()
    
    var body: some View {
        BaseTrainingView<PullupsTrainingViewModel, Any>(viewModel: viewModel)
            .navigationBarBackButtonHidden()
    }

    struct PullupsTrainingView_Previews: PreviewProvider {
        static var previews: some View {
            PullupsTrainingView()
        }
    }
}
