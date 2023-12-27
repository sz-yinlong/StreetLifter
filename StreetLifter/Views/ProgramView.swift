//
//  ProgramView.swift
//  StreetLifter
//
//  Created by Artem on 23.12.2023.
//

import SwiftUI

struct TrainingProgram: View {
    
    @StateObject private var trainingData = TrainingProgramData()
    @State private var selectedLevel = "Level 1"

    var body: some View {
        NavigationView {
            List {
                ForEach(trainingData.trainingLevels, id: \.title) { section in
                    Section(header: Text(section.title).textCase(.uppercase)) {
                        ForEach(section.levels, id: \.level) { level in
                            HStack {
                                Text(level.level)
                                Spacer()
                                HStack(spacing: 8) {
                                    ForEach(level.sets.indices, id: \.self) { index in
                                        Text("\(level.sets[index])")
                                            .frame(minWidth: 15, alignment: .trailing)
                                          
                                        
                                    }
                                }
                                .padding(.trailing, 10)

                                if selectedLevel == level.level {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                } else {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.clear)
                                }
                            }
                            .sensoryFeedback(.selection, trigger: self.selectedLevel)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                self.selectedLevel = level.level
                                print("Выбранный уровень: \(self.selectedLevel)")
                                    
                            }
                        }
                    }
                }
            }
            .navigationTitle("Training Program")
           
        }
        
    }
}


struct TrainingProgram_Previews: PreviewProvider {
    static var previews: some View {
        TrainingProgram()
    }
}
