
import Foundation

class TrainingProgramData: ObservableObject {
    @Published var pullupsTraining: [TrainingSection] = [
        TrainingSection(title: R.string.localizable.beginner(), levels: [
            TrainingLevel(level:  R.string.localizable.level1(), sets: [5, 4, 5, 4, 3]),
            TrainingLevel(level: R.string.localizable.level2(), sets: [6, 5, 5, 6, 4]),
            TrainingLevel(level: R.string.localizable.level3(), sets: [5, 6, 6, 5, 5]),
            TrainingLevel(level: R.string.localizable.level4(), sets: [6, 5, 4, 6, 5]),
            TrainingLevel(level: R.string.localizable.level5(), sets: [8, 5, 5, 4, 4]),
            TrainingLevel(level: R.string.localizable.level6(), sets: [5, 9, 5, 5, 5]),
            TrainingLevel(level: R.string.localizable.level7(), sets: [8, 6, 5, 6, 2]),
        ]),
        TrainingSection(title: R.string.localizable.intermediate(), levels: [
            TrainingLevel(level: R.string.localizable.level8(), sets: [8, 7, 6, 6, 2]),
            TrainingLevel(level: R.string.localizable.level9(), sets: [10, 6, 7, 8, 2]),
            TrainingLevel(level: R.string.localizable.level10(), sets: [8, 10, 6, 6, 2]),
            TrainingLevel(level: R.string.localizable.level11(), sets: [11, 6, 8, 6, 2]),
            TrainingLevel(level: R.string.localizable.level12(), sets: [10, 10, 10, 2, 2]),
            TrainingLevel(level: R.string.localizable.level13(), sets: [10, 9, 9, 7, 6]),
            TrainingLevel(level: R.string.localizable.level14(), sets: [11, 10, 9, 7, 5]),
        ]),
        TrainingSection(title: R.string.localizable.pro(), levels: [
            TrainingLevel(level: R.string.localizable.level15(), sets: [11, 12, 11, 10, 10]),
            TrainingLevel(level: R.string.localizable.level16(), sets: [15, 12, 10, 9, 8]),
            TrainingLevel(level: R.string.localizable.level17(), sets: [17, 12, 12, 8, 6]),
            TrainingLevel(level: R.string.localizable.level18(), sets: [14, 16, 10, 10, 10]),
            TrainingLevel(level: R.string.localizable.level19(), sets: [15, 15, 10, 10, 10]),
            TrainingLevel(level: R.string.localizable.level20(), sets: [14, 13, 12, 11, 10]),
        ]),
    ]
    
    @Published var dipsTraining: [TrainingSection] = [
        TrainingSection(title: R.string.localizable.beginner(), levels: [
            TrainingLevel(level: R.string.localizable.level1(), sets: [5, 4, 5, 4, 3]),
            TrainingLevel(level: R.string.localizable.level2(), sets: [6, 5, 5, 6, 4]),
            TrainingLevel(level: R.string.localizable.level3(), sets: [5, 6, 6, 5, 5]),
            TrainingLevel(level: R.string.localizable.level4(), sets: [6, 5, 4, 6, 5]),
            TrainingLevel(level: R.string.localizable.level5(), sets: [8, 5, 5, 4, 4]),
            TrainingLevel(level: R.string.localizable.level6(), sets: [5, 9, 5, 5, 5]),
            TrainingLevel(level: R.string.localizable.level7(), sets: [8, 6, 5, 6, 2]),
        ]),
        TrainingSection(title: R.string.localizable.intermediate(), levels: [
            TrainingLevel(level: R.string.localizable.level8(), sets: [8, 7, 6, 6, 2]),
            TrainingLevel(level: R.string.localizable.level9(), sets: [10, 6, 7, 8, 2]),
            TrainingLevel(level: R.string.localizable.level10(), sets: [8, 10, 6, 6, 2]),
            TrainingLevel(level: R.string.localizable.level11(), sets: [11, 6, 8, 6, 2]),
            TrainingLevel(level: R.string.localizable.level12(), sets: [10, 10, 10, 2, 2]),
            TrainingLevel(level: R.string.localizable.level13(), sets: [10, 9, 9, 7, 6]),
            TrainingLevel(level: R.string.localizable.level14(), sets: [11, 10, 9, 7, 5]),
        ]),
        TrainingSection(title: R.string.localizable.pro(), levels: [
            TrainingLevel(level: R.string.localizable.level15(), sets: [11, 12, 11, 10, 10]),
            TrainingLevel(level: R.string.localizable.level16(), sets: [15, 12, 10, 9, 8]),
            TrainingLevel(level: R.string.localizable.level17(), sets: [17, 12, 12, 8, 6]),
            TrainingLevel(level: R.string.localizable.level18(), sets: [14, 16, 10, 10, 10]),
            TrainingLevel(level: R.string.localizable.level19(), sets: [15, 15, 10, 10, 10]),
            TrainingLevel(level: R.string.localizable.level20(), sets: [14, 13, 12, 11, 10]),
        ]),
    ]
}
