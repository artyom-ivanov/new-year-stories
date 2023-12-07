import SwiftUI

enum YearlyStatsScreenType {
    case intro, fasts, water, days, heroIntro, avocado, watermelon, nut, friends, offer
}

struct YearlyRecapStatsView: View {
    let color: UInt
    let imageType: HeaderImageType
    let value: Int?
    let title: String
    let text: LocalizedStringKey
    let show: Bool

    @State private var isShow: Bool = false
    private let screenHeight: CGFloat = UIScreen.main.bounds.height * 1.2

    var body: some View {
        ZStack {
            VStack {
                HeaderImageView(imageType: imageType, show: $isShow)
                    .opacity(isShow ? 1 : 0)
                    .animation(.spring(duration: 0.4, bounce: 0.65).delay(0.1), value: isShow)

                VStack(spacing: 0) {
                    if value != nil {
                        HStack {
                            CounterView(targetValue: value!, isShow: isShow)
                            Spacer()
                        }
                        .offset(y: isShow ? 8 : -24)
                        .opacity(isShow ? 1 : 0)
                        .animation(.spring(duration: 0.4, bounce: 0.65).delay(0.2), value: isShow)
                    }

                    Text(title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .lineLimit(9999)
                        .font(.system(size: 28, weight: .bold))
                        .offset(y: isShow ? 0 : -24)
                        .opacity(isShow ? 1 : 0)
                        .animation(.spring(duration: 0.4, bounce: 0.65).delay(0.2), value: isShow)

                    Text(text)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 18, weight: .regular))
                        .lineLimit(9999)
                        .offset(y: isShow ? 0 : -24)
                        .opacity(isShow ? 1 : 0)
                        .animation(.spring(duration: 0.4, bounce: 0.65).delay(0.3), value: isShow)
                        .padding(.top, 16)

                }
                .foregroundStyle(Color(hex: 0x323653))
                .padding(.horizontal, 24)
                .padding(.bottom, 120)
            }
            .background(
                Circle()
                    .foregroundStyle(Color(hex: color))
                    .frame(width: screenHeight, height: screenHeight)
                    .scaleEffect(isShow ? 1 : 0)
                    .animation(.spring(duration: 1), value: isShow)
            )
            .ignoresSafeArea(.all)
        }
        .onChange(of: show) {
            isShow = $0
        }
    }
}

#Preview {
    YearlyRecapStatsView(
        color: 0xD4C9FF,
        imageType: .clock,
        value: 118,
        title: "intermittent fasts logged! That's impressive!",
        text: "That places you in the top 14% of SIMPLE fast trackers.",
        show: true
    )
}
