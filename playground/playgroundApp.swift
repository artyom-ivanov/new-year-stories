import SwiftUI

@main
struct playgroundApp: App {
    var body: some Scene {
        WindowGroup {
            YearlyRecapView(
                isPremium: true,
                userCreatedAt: Date(
                    timeIntervalSinceNow: -43 * 24 * 60 * 60
                ),
                waterCount: 131,
                fastingCount: 47,
                onClose: {}
            )
        }
    }
}
