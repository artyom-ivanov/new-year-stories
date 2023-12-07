import SwiftUI

struct YearlyRecapShareView: View {
    let color: UInt
    let imageType: HeaderImageType
    let value: Int?
    let title: String
    let text: LocalizedStringKey

    private let screenHeight: CGFloat = UIScreen.main.bounds.height * 1.2

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 1080, height: 1932)
                .background(
                    VStack {
                        ZStack {
                            Color(hex: color)
                            VStack {
                                HeaderImageView(imageType: imageType, show: .constant(true))
                                    .frame(height: 380)
                                    .scaleEffect(3, anchor: .top)
                                    .offset(y: -120)

                                Spacer()

                                VStack(spacing: 0) {
                                    if value != nil {
                                        HStack {
                                            Text("\(value!)")
                                                .font(.system(size: 80 * 3, weight: .black))
                                            Spacer()
                                        }
                                        .offset(x: -2 * 3, y: 8 * 3)
                                    }

                                    Text(title)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(9999)
                                        .font(.system(size: 28 * 3, weight: .bold))

                                    Text(text)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 18 * 3, weight: .regular))
                                        .lineLimit(9999)
                                        .padding(.top, 16 * 3)

                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundStyle(Color(hex: 0x323653).opacity(0.2))
                                        .padding(.top, 32 * 3)

                                    HStack(spacing: 8 * 3) {
                                        Image("simple_logo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 41 * 3, height: 41 * 3)

                                        VStack(alignment: .leading, spacing: 0) {
                                            Text("SIMPLE")
                                                .tracking(1.4)
                                                .font(.system(size: 14 * 3, weight: .semibold))
                                            Text("Fasting & Meal Tracker")
                                                .font(.system(size: 11 * 3, weight: .semibold))
                                                .opacity(0.6)
                                                .padding(.top, 2 * 3)
                                        }
                                        .padding(.bottom, 2 * 3)

                                        Spacer()
                                    }
                                    .padding(.top, 16 * 3)

                                }
                                .foregroundStyle(Color(hex: 0x323653))
                                .padding(.horizontal, 24*3)
                                .padding(.bottom, 120)
                            }
                        }
                    }
                )
                .clipped()
                .offset(y: -12)
        }
        .frame(width: 1080, height: 1932)
    }
}

#Preview {
    YearlyRecapShareView(
        color: 0xD4C9FF,
        imageType: .clock,
        value: 118,
        title: "fasts logged",
        text: "You’re living life in the intermittent fast lane — solid work!"
    )
    .scaleEffect(0.3)
}
