// TrainingprogrmaList.swift
import Foundation

class TrainingProgramData: ObservableObject {
    @Published var pullupsTraining: [TrainingSection] = [
        TrainingSection(title: "Beginner", levels: [
            TrainingLevel(level: "Level 1", sets: [5, 4, 5, 4, 3]),
            TrainingLevel(level: "Level 2", sets: [6, 5, 5, 6, 4]),
            TrainingLevel(level: "Level 3", sets: [5, 6, 6, 5, 5]),
            TrainingLevel(level: "Level 4", sets: [6, 5, 4, 6, 5]),
            TrainingLevel(level: "Level 5", sets: [8, 5, 5, 4, 4]),
            TrainingLevel(level: "Level 6", sets: [5, 9, 5, 5, 5]),
            TrainingLevel(level: "Level 7", sets: [8, 6, 5, 6, 2]),
        ]),
        TrainingSection(title: "Intermediate", levels: [
            TrainingLevel(level: "Level 8", sets: [8, 7, 6, 6, 2]),
            TrainingLevel(level: "Level 9", sets: [10, 6, 7, 8, 2]),
            TrainingLevel(level: "Level 10", sets: [8, 10, 6, 6, 2]),
            TrainingLevel(level: "Level 11", sets: [11, 6, 8, 6, 2]),
            TrainingLevel(level: "Level 12", sets: [10, 10, 10, 2, 2]),
            TrainingLevel(level: "Level 13", sets: [10, 9, 9, 7, 6]),
            TrainingLevel(level: "Level 14", sets: [11, 10, 9, 7, 5]),
        ]),
        TrainingSection(title: "Pro", levels: [
            TrainingLevel(level: "Level 15", sets: [11, 12, 11, 10, 10]),
            TrainingLevel(level: "Level 16", sets: [15, 12, 10, 9, 8]),
            TrainingLevel(level: "Level 17", sets: [17, 12, 12, 8, 6]),
            TrainingLevel(level: "Level 18", sets: [14, 16, 10, 10, 10]),
            TrainingLevel(level: "Level 19", sets: [15, 15, 10, 10, 10]),
            TrainingLevel(level: "Level 20", sets: [14, 13, 12, 11, 10]),
        ]),
    ]
    
    @Published var dipsTraining: [TrainingSection] = [
        TrainingSection(title: "Beginner", levels: [
            TrainingLevel(level: "Level 1", sets: [5, 4, 5, 4, 3]),
            TrainingLevel(level: "Level 2", sets: [6, 5, 5, 6, 4]),
            TrainingLevel(level: "Level 3", sets: [5, 6, 6, 5, 5]),
            TrainingLevel(level: "Level 4", sets: [6, 5, 4, 6, 5]),
            TrainingLevel(level: "Level 5", sets: [8, 5, 5, 4, 4]),
            TrainingLevel(level: "Level 6", sets: [5, 9, 5, 5, 5]),
            TrainingLevel(level: "Level 7", sets: [8, 6, 5, 6, 2]),
        ]),
        TrainingSection(title: "Intermediate", levels: [
            TrainingLevel(level: "Level 8", sets: [8, 7, 6, 6, 2]),
            TrainingLevel(level: "Level 9", sets: [10, 6, 7, 8, 2]),
            TrainingLevel(level: "Level 10", sets: [8, 10, 6, 6, 2]),
            TrainingLevel(level: "Level 11", sets: [11, 6, 8, 6, 2]),
            TrainingLevel(level: "Level 12", sets: [10, 10, 10, 2, 2]),
            TrainingLevel(level: "Level 13", sets: [10, 9, 9, 7, 6]),
            TrainingLevel(level: "Level 14", sets: [11, 10, 9, 7, 5]),
        ]),
        TrainingSection(title: "Pro", levels: [
            TrainingLevel(level: "Level 15", sets: [11, 12, 11, 10, 10]),
            TrainingLevel(level: "Level 16", sets: [15, 12, 10, 9, 8]),
            TrainingLevel(level: "Level 17", sets: [17, 12, 12, 8, 6]),
            TrainingLevel(level: "Level 18", sets: [14, 16, 10, 10, 10]),
            TrainingLevel(level: "Level 19", sets: [15, 15, 10, 10, 10]),
            TrainingLevel(level: "Level 20", sets: [14, 13, 12, 11, 10]),
        ]),
    ]
}
