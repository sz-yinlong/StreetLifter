import SwiftUI

enum Constants {
    // MARK: - CGFloat

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
    static let fontPrimary = CGFloat(12)
    static let fontSecondary = CGFloat(10)
    static let fontDate = CGFloat(14)
    static let opacity = CGFloat(0.1)

    // MARK: - Colors

    static let tomato = Color(red: 255 / 255, green: 82 / 255, blue: 51 / 255)
    static let bitterSweet = Color(red: 240 / 255, green: 25 / 255, blue: 78 / 255, opacity: 1)
    static let robinEggBlue = Color(red: 0 / 255, green: 199 / 255, blue: 220 / 255, opacity: 1)
    static let acidGreen = Color(red: 78 / 255, green: 226 / 255, blue: 0 / 255, opacity: 1)

    static let trainingBackgroundGradient = LinearGradient(
        gradient: 
            Gradient(
                colors: [Color(.systemGray5),
                         Color(.systemBackground),
                         Color(.systemBackground)]),
        startPoint: .top,
        endPoint: .bottom
    )
}

struct Constants_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(TrainingSessionsManager())
    }
}
