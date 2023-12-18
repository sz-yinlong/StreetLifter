
import SwiftUI

struct StatsView: View {
    var trainingSessions: [TrainingSession]
    var chartColor: Color
    
    var body: some View {
        ZStack {
            
            NavigationStack {
                VStack {
                    StatsChart(trainingSessions: trainingSessions)
                        .foregroundStyle(chartColor)
                    Spacer()
                    GeometryReader { geo in
                        VStack {
                            List {
                                header: do {
                                    Text(R.string.localizable.trainingHistory())
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                                ForEach(trainingSessions, id: \.self) { session in
                                    HStack {
                                        Text(session.date)
                                            .font(.system(size: Constants.fontDate))

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
                            .toolbar(.hidden, for: .tabBar)
                        }
                    }
                }
            }
        }
    }
}
