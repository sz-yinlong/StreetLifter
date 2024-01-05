

import SwiftUI

struct BaseTrainingView<ViewModel: BaseTrainingViewModel, TrainingViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    @StateObject var storage = TrainingSessionStorage()
    @State private var showingLevels = false
    
    @Environment(\.dismiss) var dismiss
    
    var backgroundColor: Color
    var showProgramView: (() -> Void)?
    
    init(viewModel: ViewModel, backgroundColor: Color = .secondary) {
        let storage = TrainingSessionStorage()
       
        _viewModel = StateObject(wrappedValue: viewModel)
       
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        NavigationStack {
            if #available(iOS 17.0, *) {
                if viewModel.trainingCompleted {
                    
                    VStack {
                        Spacer()
                        Image(systemName: "trophy")
                            .font(Font.system(size: 50))
                            .padding()
                        Text("Good job!\n You've done \(viewModel.lastSessionTotalReps ?? 0) reps.")
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 250)
                     
                        NavigationLink(destination: TabBar()) {
                           backgroundColor
                                .frame(maxWidth: 300, maxHeight: 50)
                                .cornerRadius(10)
                                .overlay(
                                    Text(R.string.localizable.main())
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    
                                )
                        }
                        .padding()
                    }
                    .navigationBarBackButtonHidden()
                    .onAppear {
                        viewModel.completeSet()
                  
                    }
                } else {
                    ZStack {
//                        RoundedRectangle(cornerRadius: 10)
//                            .frame(width: 100, height: 100, alignment: .center)
//                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 230, trailing: 0))
//                            .foregroundColor(.blue)
                            
                           
                            
                        VStack {
                            HStack(spacing: 12) {
                                ForEach(Array(viewModel.mutableRepetitions.enumerated()), id: \.offset) { index, repetition in
                                    Button(action: {
                                        withAnimation {
                                            viewModel.currentSetIndex = index
                                            viewModel.reps = viewModel.mutableRepetitions[index]
                                            
                                        }
                                    }) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(index == viewModel.currentSetIndex ? backgroundColor : Color.secondary.opacity(0.15))
                                            .frame(width: 55, height: 45)
                                            .overlay(
                                                Text("\(repetition)")
                                                    .font(.title)
                                                    .foregroundColor(index == viewModel.currentSetIndex ? .white : .primary)
                                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
//                                                Text(viewModel.tempSelectedWeight)
                                            )
                                    }
                                }
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 8)
                            
                            Spacer()
                            Text(viewModel.currentSetIndex < viewModel.mutableRepetitions.count ? "\(viewModel.mutableRepetitions[viewModel.currentSetIndex])" : "0")
                                .font(.system(size: 80))
                                .foregroundStyle(.primary)
                                .bold()
                                .fontDesign(.rounded)
                               
                            Spacer()
                            
                            HStack(alignment: .center) {
                                Button(action: {
                                    viewModel.decrementReps()
                                }) {
                                    Image(systemName: "minus.circle")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 50))
                                }
                                Spacer()
                                
                                Text(R.string.localizable.repsCaps())
                                
                                Spacer()
                                
                                Button(action: {
                                    viewModel.incrementReps()
                                }) {
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 50))
                                }
                            }
                            .font(.largeTitle)
                            .padding()
                            
                            HStack {
                                HStack {
                                    Toggle("", isOn: $viewModel.isWeightAdded)
                                        .labelsHidden()
                                    Text(R.string.localizable.addWeight())
                                }
                                Picker("Weight", selection: $viewModel.selectedWeightIndex) {
                                    ForEach(0 ..< viewModel.availableWeights.count, id: \.self) {
                                        index in
                                        Text("\(viewModel.availableWeights[index])kg").tag(index)
                                    }
                                }
                                .onChange(of: viewModel.selectedWeightIndex, perform: { newValue in
                                    viewModel.tempSelectedWeight = viewModel.availableWeights[newValue]
                                    print("Выбранный вес: \(viewModel.availableWeights[newValue])кг")
                                })
                                .onChange(of: viewModel.selectedLevel) { _ in
                                    viewModel.selectLevel(level: viewModel.selectedLevel)
                                }
                                
                                .disabled(!viewModel.isWeightAdded)
                                .frame(width: 100, height: 100)
                                .pickerStyle(WheelPickerStyle())
                                .padding()
                                .opacity(viewModel.isWeightAdded ? 1 : 0.2)
                            }
                            
                            VStack {
                                Button(action: {
                                    if viewModel.canAddSet {
                                        viewModel.trainingCompleted = false
                                    } else {
                                        viewModel.trainingCompleted = true
                                        viewModel.saveTrainingSession()
                                    }
                                    viewModel.saveRepsForCurrentSession()
                                }) {
                                    Text(R.string.localizable.done()
                                    )
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: 300, maxHeight: 50)
                                    .cornerRadius(10)
                                }
                                .background(.blue)
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
            } else {}
        }
        .navigationBarBackButtonHidden()
        .fontDesign(.rounded)
        .background(Color(.systemBackground))
            
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                }
                .fontWeight(.medium)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("\(viewModel.selectedLevel)") {
                    showingLevels = true
                }
                .padding(.top, 8)
                .padding(.trailing, 8)
            
                .sheet(isPresented: $showingLevels) {
                    ProgramView().environmentObject(viewModel)
                }
            }
        }
        .onAppear {
            viewModel.startNewSession()
                           viewModel.updateMostRecentTotalReps()
                           viewModel.setCurrentRepsToCurrentSet()
        }
    }
}

#Preview {
    PullupsTrainingView()
        .environmentObject(TrainingSessionsManager())
}
