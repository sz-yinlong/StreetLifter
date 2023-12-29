

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
                        Spacer()
                        NavigationLink(destination: TabBar()) {
                            Color.blue
                                .frame(maxWidth: 300, maxHeight: 50)
                                .cornerRadius(10)
                                .overlay(
                                    Text(R.string.localizable.main())
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .padding(8)
                                )
                        }
                    }
                    .onAppear {
                       
                    }
                } else {
                    
                    VStack {

                        HStack(spacing: 20) {
                            ForEach(Array(viewModel.mutableRepetitions.enumerated()), id: \.element) { index, repetition in
                                Text("\(repetition)")
                                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                                    .foregroundStyle(backgroundColor)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .background(Color.secondary.opacity(0.06))
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        viewModel.currentSetIndex = index // При тапе устанавливаем текущий сет
                                        viewModel.reps = viewModel.mutableRepetitions[index]
                                    }
                            }
                        
                        }
                        

                        Spacer()
                        Text(viewModel.currentSetIndex < viewModel.mutableRepetitions.count ? "\(viewModel.mutableRepetitions[viewModel.currentSetIndex])" : "0")
                            .font(.system(size: 70))
                            .foregroundStyle(.primary)
                            .bold()

                        
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
                                viewModel.saveWeightForCurrentSession()
                            }) {
                                Text(R.string.localizable.done()
                                )
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: 300)
                                .frame(maxHeight: 50)
                                .cornerRadius(10)
                            }
                            .background(.blue)
                            .cornerRadius(10)
                        }
                    }
                    .padding()
                }
            } else {}
        }
        .navigationBarBackButtonHidden()
            
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
        }
    }
}

#Preview {
    TabBar()
        .environmentObject(TrainingSessionsManager())
}
