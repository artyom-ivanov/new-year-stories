import SwiftUI
import UIKit

struct YearlyRecapView: View {
    let isPremium: Bool
    let userCreatedAt: Date
    let waterCount: Int
    let fastingCount: Int
    let onClose: () -> Void

    @State private var buttonText: String = "Continue"
    @State private var currentScreen = 0
    @State private var shareImage: UIImage?

    var body: some View {
        ZStack {
            Color(hex: 0x896EF7)
                .ignoresSafeArea()

            Button(action: {
                currentScreen = 1
            }) {
                Text("Start")
                    .foregroundStyle(.white)
            }

            YearlyRecapStatsView(
                color: 0xFFEBA5,
                imageType: .compass,
                value: nil,
                title: "Which Health Hero were you this year?",
                text: "First, let’s take a sec to review the small but mighty steps you took in 2023 towards your wellness goals!",
                show: shouldShowScreen(.intro)
            )
            YearlyRecapStatsView(
                color: 0xFFB6B6,
                imageType: .calendar,
                value: daysSpentWithUs,
                title: "days on SIMPLE to date",
                text: "That’s a lot of days investing in our most important feature — you!",
                show: shouldShowScreen(.days)
            )
            YearlyRecapStatsView(
                color: 0xD4C9FF,
                imageType: .clock,
                value: fastingCount,
                title: "fasts logged",
                text: meetFastsThreshold
                    ? "You’re living life in the intermittent fast lane — solid work!"
                    : "Let’s build your intermittent fast track in the new year and find a schedule that works for you!",
                show: shouldShowScreen(.fasts)
            )
            YearlyRecapStatsView(
                color: 0x9FDFFA,
                imageType: .water,
                value: waterCount,
                title: "times logging water",
                text: meetWaterThreshold
                    ? "A tidal wave of hydration to ride into the new year!"
                    : "We see you making waves in 2024. Ready to take your hydration to the next level?",
                show: shouldShowScreen(.water)
            )
            YearlyRecapStatsView(
                color: 0xFFD1E7,
                imageType: .bottle,
                value: nil,
                title: "Ready to meet your Health Hero?",
                text: "Consider your Health Hero as the symbol of your wellness journey so far. Who says you need a \"new you\" in the new year? You're already a hero!",
                show: shouldShowScreen(.heroIntro)
            )

            // Heroes
            YearlyRecapStatsView(
                color: 0xCEEE8B,
                imageType: .avocado,
                value: nil,
                title: "The Ripest Avocado",
                text: "Your \(daysSpentWithUs) days with SIMPLE makes you wellness-wise like a ripe avocado. You prioritized your health and well-being with thousands of users around the globe!",
                show: shouldShowScreen(.avocado)
            )
            YearlyRecapStatsView(
                color: 0xCEEE8B,
                imageType: .watermelon,
                value: nil,
                title: "The Watermelon Warrior",
                text: "Your hydration dedication is as refreshing as a juicy watermelon. You’re making a splash with the top \(topWaterPercent)% of SIMPLE sippers.",
                show: shouldShowScreen(.watermelon)
            )
            YearlyRecapStatsView(
                color: 0xFFE6A5,
                imageType: .nut,
                value: nil,
                title: "One Tough Nut",
                text: "The \(fastingCount) sessions of fasting you’ve hit are as impressive as cracking a strong nut! That places you in the top \(topFastingPercent)% of SIMPLE fasters.",
                show: shouldShowScreen(.nut)
            )

            YearlyRecapStatsView(
                color: 0xFFE6A5,
                imageType: .hand,
                value: nil,
                title: "Everything’s better with friends",
                text: "Share and invite your closest friends and family to join you in your SIMPLE journey.",
                show: shouldShowScreen(.friends)
            )
            YearlyRecapStatsView(
                color: 0xFFE6A5,
                imageType: .hand,
                value: nil,
                title: "Get 33% off Premium for a limited time",
                text: "Boost your wellness journey in the new year with daily guidance and personalized insights.\n\nOnly ~~$29.99~~ $19.99 for 12 weeks!",
                show: shouldShowScreen(.offer)
            )

            // Bottom buttons
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        onClose()
                    }) {
                        Circle()
                            .overlay(
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color(hex: 0x323653))
                            )
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.white)
                    }
                    .scaleEffect(currentScreen == 7 ? 1 : 0)
                    .offset(y: currentScreen == 7 ? 0 : -120)
                    .opacity(currentScreen == 7 ? 1 : 0)
                    .animation(.spring(duration: 0.4, bounce: 0.45).delay(0.1), value: currentScreen)
                }
                .padding(.horizontal, 24)
                Spacer()
                ZStack {
                    HStack {
                        Button(action: {
                            share()
                        }) {
                            Circle()
                                .overlay(
                                    Image(systemName: "square.and.arrow.up")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundColor(.white)
                                        .offset(y: -3)
                                )
                                .frame(width: 56, height: 56)
                                .foregroundStyle(Color(hex: 0x323653))
                        }
                        .scaleEffect(shouldShowShareButton ? 1 : 0)
                        .offset(y: shouldShowShareButton ? 0 : 80)
                        .opacity(shouldShowShareButton ? 1 : 0)
                        .animation(.spring(duration: 0.4, bounce: 0.45).delay(0.1), value: shouldShowShareButton)
                        Spacer()
                    }

                    Button(action: {
                        next()
                    }) {
                        Capsule()
                            .foregroundColor(.white)
                            .frame(height: 56)
                            .overlay(
                                HStack(spacing: 8) {
                                    Text(buttonText)
                                    if buttonText == "Continue" {
                                        Image(systemName: "arrow.right")
                                    }
                                }
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(Color(hex: 0x323653))
                            )
                    }
                    .padding(.leading, shouldShowShareButton ? 68 : 0)
                    .offset(y: currentScreen > 0 ? 0 : -24)
                    .opacity(currentScreen > 0 ? 1 : 0)
                    .animation(.spring(duration: 0.4, bounce: 0.45).delay(0.6), value: currentScreen)
                    .animation(.spring(duration: 0.4, bounce: 0.45).delay(1.4), value: shouldShowShareButton)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 12)
            }

            // Sharing screen
            YearlyRecapSharePopupView(shareImage: shareImage, show: shareImage != nil, onClose: {
                shareImage = nil
            })
        }
    }

    private var shouldShowShareButton: Bool {
        let skipShareScreens: [YearlyStatsScreenType] = [.intro, .heroIntro, .offer, .friends]
        let skipScreenIndexes = skipShareScreens.compactMap { indexForScreen($0) }
        return !skipScreenIndexes.contains(currentScreen) && currentScreen != 0
    }

    private var choosedHero: YearlyStatsScreenType {
        if fastingCount > 39 {
            return .nut
        } else if waterCount > 92 {
            return .watermelon
        } else {
            return .avocado
        }
    }

    private var meetFastsThreshold: Bool {
        fastingCount > 13 // 50% percentile
    }

    private var meetWaterThreshold: Bool {
        waterCount > 20 // 50% percentile
    }

    private var daysSpentWithUs: Int {
        Calendar.current.dateComponents([.day], from: userCreatedAt, to: Date()).day ?? 0
    }

    private func indexForScreen(_ screenType: YearlyStatsScreenType) -> Int? {
        switch screenType {
        case .intro:
            return 1
        case .days:
            return 2
        case .fasts:
            return 3
        case .water:
            return 4
        case .heroIntro:
            return 5
        case .avocado:
            if choosedHero != .avocado {
                return nil
            }
            return 6
        case .watermelon:
            if choosedHero != .watermelon {
                return nil
            }
            return 6
        case .nut:
            if choosedHero != .nut {
                return nil
            }
            return 6
        case .friends:
            return isPremium ? 7 : nil
        case .offer:
            return isPremium ? nil : 7
        }
    }

    private func shouldShowScreen(_ screenType: YearlyStatsScreenType) -> Bool {
        guard let screenIndex = indexForScreen(screenType) else {
            return false
        }
        return currentScreen >= screenIndex
    }

    private func next() {
        guard currentScreen < 7 else {
            if isPremium {
//                let url = URL(string: "https://simple-life-app.com/?from=referral_ios_ny2023")!
                // open native share
            } else {
                // show offer by deeplink
            }
            return
        }
        currentScreen += 1
        if currentScreen == 7 {
            buttonText = isPremium ? "Invite now" : "Unlock offer"
        }
    }

    private func share() {
        shareImage = getShareImage()
    }

    private var waterPercentiles: [(count: Double, percentile: Int)] {
        let from75Percentile: [Double] = [92, 98, 104, 111, 119, 127, 136, 146, 157, 169, 182, 196.56, 213, 232, 252, 276, 303, 336, 379, 430.24, 496, 588, 724, 934, 1340]
        return from75Percentile.enumerated().map { (index, count) in
            (count: count, percentile: index + 75)
        }
    }

    private var fastingPercentile: [(count: Double, percentile: Int)] {
        let from75Percentile: [Double] = [39, 41, 43, 45, 47, 50, 53, 55, 58, 62, 66, 70, 74, 79, 85, 92, 100, 110, 121, 135, 153, 177, 210, 257, 317]
        return from75Percentile.enumerated().map { (index, count) in
            (count: count, percentile: index + 75)
        }
    }

    private var topWaterPercent: Int {
        100 - (waterPercentiles.first(where: { $0.count > Double(waterCount) })?.percentile ?? 99)
    }

    private var topFastingPercent: Int {
        100 - (fastingPercentile.first(where: { $0.count > Double(fastingCount) })?.percentile ?? 99)
    }

    private func getShareImage() -> UIImage {
        var color: UInt
        var imageType: HeaderImageType
        var value: Int?
        var title: String
        var text: LocalizedStringKey
        
        switch currentScreen {
        case 2:
            //days
            color = 0xFFB6B6
            imageType = .calendar
            value = daysSpentWithUs
            title = "days on SIMPLE to date"
            text = "That’s a lot of days investing in our most important feature — you!"
            break
        case 3:
            // fasts
            color = 0xD4C9FF
            imageType = .clock
            value = fastingCount
            title = "fasts logged"
            text = meetFastsThreshold
                ? "You’re living life in the intermittent fast lane — solid work!"
                : "Let’s build your intermittent fast track in the new year and find a schedule that works for you!"
            break
        case 4:
            // water
            color = 0x9FDFFA
            imageType = .water
            value = waterCount
            title = "times logging water"
            text = meetWaterThreshold
                ? "A tidal wave of hydration to ride into the new year!"
                : "We see you making waves in 2024. Ready to take your hydration to the next level?"
            break
        case 6:
            // hero
            if choosedHero == .avocado {
                color = 0xCEEE8B
                imageType = .avocado
                value = nil
                title = "The Ripest Avocado"
                text = "Your \(daysSpentWithUs) days with SIMPLE makes you wellness-wise like a ripe avocado. You prioritized your health and well-being with thousands of users around the globe!"
            } else if choosedHero == .nut {
                color = 0xFFE6A5
                imageType = .nut
                value = nil
                title = "One Tough Nut"
                text = "The \(fastingCount) sessions of fasting you’ve hit are as impressive as cracking a strong nut! That places you in the top \(topFastingPercent)% of SIMPLE fasters."
            } else {
                color = 0xCEEE8B
                imageType = .watermelon
                value = nil
                title = "The Watermelon Warrior"
                text = "Your hydration dedication is as refreshing as a juicy watermelon. You’re making a splash with the top \(topWaterPercent)% of SIMPLE sippers."
            }
            break
        default:
            return UIImage()
        }

        let controller = UIHostingController(rootView: YearlyRecapShareView(
            color: color,
            imageType: imageType,
            value: value,
            title: title,
            text: text
        ))
        let view = controller.view
        let targetSize = CGSize(width: 1080, height: 1920)
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

#Preview {
    YearlyRecapView(
        isPremium: false,
        userCreatedAt: Date(
            timeIntervalSinceNow: -43 * 24 * 60 * 60
        ),
        waterCount: 280,
        fastingCount: 320,
        onClose: {}
    )
}
