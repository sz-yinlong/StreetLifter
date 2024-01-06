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
                            Section(header: Text(R.string.localizable.trainingHistory())
                                .font(.subheadline)
                                .foregroundStyle(Color.primary))
                            {
                                ForEach(trainingSessions, id: \.id) { session in
                                    HStack {
                                        Text(session.date)
                                            .font(.system(size: Constants.fontDate))
                                        Spacer(minLength: 35)
                                        HStack(spacing: 8) {
                                            ForEach(session.combinedRepsAndWeight, id: \.id) { repsAndWeight in
                                                VStack {
                                                    Text("\(repsAndWeight.reps)")
                                                        .font(.system(size: Constants.fontPrimary))
                                                        .fontWeight(.medium)
                                                        .padding(.bottom, 5)
                                                    Text("\(repsAndWeight.weight) kg")
                                                        .font(.system(size: Constants.fontSecondary))
                                                        .foregroundColor(.secondary)
                                                }
                                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                                                .padding(.vertical, 5)
                                                .background(Color.secondary.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.trailing, 1)
                        .listStyle(.inset)
                    }
                }
            }
        }
    }
}

struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(trainingSessions: [], chartColor: .blue)
    }
}
