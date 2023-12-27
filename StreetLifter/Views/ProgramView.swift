//
//  TrainingProgram.swift
//  StreetLifter
//
//  Created by Artem on 23.12.2023.
//

import SwiftUI

struct TrainingProgram: View {
    

    @State private var selectedLevel = "Level 1"

    var body: some View {
        NavigationView {
            List {
                ForEach(trainingLevels, id: \.title) { section in
                    Section(header: Text(section.title).textCase(.uppercase)) {
                        ForEach(section.levels, id: \.level) { level in
                            HStack {
                                Text(level.level)
                                Spacer()
                                HStack {
                                    ForEach(level.sets.indices, id: \.self) { index in
                                        Text("\(level.sets[index])")
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
