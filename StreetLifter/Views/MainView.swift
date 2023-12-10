//
//  MainView.swift
//  StreetLifter
//
//  Created by Artem on 10.12.2023.
//



import SwiftUI

struct MainView<TrainingViewModel: PullupsTrainingViewModel>: View {
    @StateObject private var viewModel: TrainingViewModel
    @State private var showChart: Bool = true
    
    init(viewModel: TrainingViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        showChart = viewModel.shouldDisplayChart()
    }
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundStyle(LinearGradient(colors: [.red, .orange.opacity(0.5), Color.secondary.opacity(0.1)], startPoint: .top, endPoint: .bottom))
                    .padding(EdgeInsets(top: geo.size.height * 0.0, leading: 0, bottom: geo.size.height * 0.125, trailing: 0))
                    .ignoresSafeArea()
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundStyle( .white )
                    .padding(EdgeInsets(top: geo.size.height * 0.17, leading: 10, bottom: geo.size.height * 0.76, trailing: 10))
                    .ignoresSafeArea()
                BarChart(trainingSession: viewModel.trainingSessions)
                    .padding(EdgeInsets(top: geo.size.height * 0.10, leading: 10, bottom: geo.size.height * 0.65, trailing: 10))
                
               
            }
          
            
            VStack {
              
                exerciseButton(destination: PullupsTrainingView(),
                               title: R.string.localizable.pullups(),
                               reps: viewModel.lastSessionTotalReps!,
                               weight: viewModel.weight
                               )
                
                exerciseButton(destination: DipsTrainingView(),
                               title: R.string.localizable.dips(),
                               reps: viewModel.lastSessionTotalReps!,
                               weight: viewModel.weight
                               )
                
                 
                
                
            }
            .padding(EdgeInsets(top: geo.size.height * 0.63, leading: 10, bottom: geo.size.height * 0.0, trailing: 10))
            
        }
        
    }
    
    
    private func exerciseButton<Destination: View>(destination: Destination, title: String, reps: Int, weight: Int) -> some View {
        
        NavigationLink(destination: destination) {
            VStack(alignment: .leading) {
                
                HStack {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                        .font(.title3)
                
                }
                VStack(alignment: .leading) {
                    HStack {
                            Text("Last:")
                            .foregroundStyle(.secondary)
                            Text("\(reps)")
                            .foregroundStyle(.primary)
                            Text("times")
                            .foregroundStyle(.secondary)
                        }
                    HStack {
                            Text("Avg. weight:")
                            .foregroundStyle(.secondary)
                            Text("\(weight)")
                            .foregroundStyle(.primary)
                            .foregroundStyle(.secondary)
                        Text("kg")
                        }
                }
                .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 0))
            
                
            }
            .padding()
            .background(.white)
            .cornerRadius(10)
            .navigationBarBackButtonHidden(true)
            .shadow(radius: 10)
            
        }
        .navigationTitle("Training")
    }
        
    
}





func destinationView(for exerciseType: ExerciseType) -> some View {
    AnyView(
        Group {
            switch exerciseType {
            case .pullups:
                PullupsTrainingView()
            case .dips:
                DipsTrainingView()
            }
        }
    )
}

#Preview {
    TabBar()
}



private struct Constants {
    static let sessionDateWidth = CGFloat(80)
    static let sessionSpacing = CGFloat(4)
    static let sessionVStackWidth = CGFloat(28)
    static let sessionVPaddingVertical = CGFloat(2)
    static let sessionVPaddingHorizontal = CGFloat(8)
    static let sessionVCornerRadius = CGFloat(8)
    static let sessionHAlignmentGuide = CGFloat(275)
    static let buttonMaxWidth = CGFloat(350)
    static let buttonMaxHeight = CGFloat(120)
    static let buttonCornerRadius = CGFloat(10)
    static let fontPrimary = CGFloat(10)
    static let fontSecondary = CGFloat(8)
    static let fontDate = CGFloat(12)
    static let opacity = CGFloat(0.1)
}
