
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
                                        .padding(.leading, 10)
                                        .font(.system(size: Constants.fontDate))
                                        
                                    Spacer()
                                    HStack(spacing: 15) {
                                        ForEach(Array(zip(session.reps, session.weight)), id: \.0) { reps, weight in
                                            VStack {
                                                Text("\(reps)")
                                                    .font(.system(size: Constants.fontPrimary))
                                                    .fontWeight(.medium)
                                                    .padding(.bottom, 3)
                                             
                                                
                                                Text("\(weight) kg")
                                                    .font(.system(size: Constants.fontSecondary))
                                                    .foregroundColor(.secondary)
                                               
                                            }
                                            .padding(EdgeInsets(top: 5, leading: 12, bottom: 5, trailing: 12))
                                            .background(Color.secondary.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
                                        
                                        }
                                    }
                                  
                                  
                                }
                            }
                            .listSectionSeparator(.hidden)
                            
                        }
                        .padding(.trailing, 1)
                        .listStyle(.inset)
                        .toolbar(.hidden, for: .tabBar)
                    }
                }
            }
        }
    }
}

struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        StatsPageTabView()
            .environmentObject(TrainingSessionsManager())
    }
}
