
import SwiftUI

struct StatsView<TrainingViewModel: BaseTrainingViewModel>: View {
    @EnvironmentObject var viewModel: TrainingViewModel
   
    @StateObject private var pullupsViewModel: PullupsTrainingViewModel
    @StateObject private var dipsViewModel: DipsTrainingViewModel
    
    init() {
        let storage = TrainingSessionStorage()
        self._pullupsViewModel = StateObject(wrappedValue: PullupsTrainingViewModel(storage: storage))
        self._dipsViewModel = StateObject(wrappedValue: DipsTrainingViewModel(storage: storage))
    }
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    StatsChart(pullupsTrainingSesion: pullupsViewModel.trainingSessions, dipsTrainingSession: dipsViewModel.trainingSessions)
                    Spacer()
                    GeometryReader { geo in
                        VStack {
                            List {
                                header: do {
                                    Text(R.string.localizable.trainingHistory())
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                                ForEach(pullupsViewModel.trainingSessions, id: \.self) { session in
                                    HStack {
                                        Text(session.date)
                                            .font(.system(size: Constants.fontDate))
                                            .foregroundColor(.secondary)
                                          
                                        Spacer()
                                        
                                        HStack(alignment: .top, spacing: Constants.sessionSpacing) {
                                            ForEach(Array(zip(session.reps, session.weight)), id: \.0) { reps, weight in
                                                VStack {
                                                    Text("\(reps)")
                                                        .font(.system(size: Constants.fontPrimary))
                                                        .fontWeight(.medium)
                                                    
                                                    Divider()
                                                    Text("\(weight) kg")
                                                        .font(.system(size: Constants.fontSecondary))
                                                        .foregroundColor(.secondary)
                                                }
                                               
                                                .padding(.vertical, Constants.sessionVPaddingVertical)
                                                .padding(.horizontal, Constants.sessionVPaddingHorizontal)
                                                .background(Color.secondary.opacity(Constants.opacity))
                                                .cornerRadius(Constants.sessionVCornerRadius)
                                            }
                                        }
                                    }
                                }
                                .listSectionSeparator(.hidden)
                                .alignmentGuide(.listRowSeparatorTrailing) { _ in Constants.sessionHAlignmentGuide }
                            }
                            .listStyle(.insetGrouped)
                            .padding(.top)
                            .padding([.leading, .trailing], geo.size.width * -0.03)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    StatsView().environmentObject(BaseTrainingViewModel())
}
