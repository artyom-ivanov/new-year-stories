import SwiftUI

struct YearlyRecapSharePopupView: View {

    let shareImage: UIImage?
    let show: Bool
    let onClose: () -> Void

    @State private var isShow: Bool = false
    @State private var isHidden: Bool = true
    private let screenHeight: CGFloat = UIScreen.main.bounds.height * 1.2

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button(action: onClose) {
                        Circle()
                            .overlay(
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color(hex: 0x323653))
                            )
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.white)
                    }
                    .scaleEffect(isShow ? 1 : 0)
                    .offset(y: isShow ? 0 : -120)
                    .opacity(isShow ? 1 : 0)
                    .animation(.spring(duration: 0.4, bounce: isHidden ? 0 : 0.45).delay(isHidden ? 0 : 0.3), value: isShow)
                }
                .padding(.horizontal, 24)

                Image(uiImage: shareImage ?? UIImage())
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width - 64, height: (UIScreen.main.bounds.width - 64) / 0.5625)
                    .background(
                        ZStack {
                            Color.white
                            ProgressView()
                                .foregroundStyle(.black)
                        }
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                    )
                    .padding(.top, 24)
                    .offset(y: isShow ? 0 : -24)
                    .opacity(isShow ? 1 : 0)
                    .animation(.spring(duration: 0.4, bounce: isHidden ? 0 : 0.65).delay(isHidden ? 0 : 0.4), value: isShow)

                Text("SHARE USING")
                    .font(.system(size: 16, weight: .bold))
                    .tracking(1.05)
                    .foregroundStyle(.white.opacity(0.8))
                    .padding(.top, 24)
                    .offset(y: isShow ? 0 : -24)
                    .opacity(isShow ? 1 : 0)
                    .animation(.spring(duration: 0.4, bounce: isHidden ? 0 : 0.65).delay(isHidden ? 0 : 0.5), value: isShow)

                HStack(spacing: 16) {
                    Button(action: {}, label: {
                        VStack(spacing: 8) {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .frame(width: 48, height: 48)
                                .overlay(
                                    Image("insta_logo")
                                        .resizable()
                                        .scaledToFit()
                                )
                                .clipped()
                            Text("Instagram")
                                .font(.system(size: 11))
                        }
                    })
                    .foregroundStyle(.white)
                    .offset(y: isShow ? 0 : -24)
                    .opacity(isShow ? 1 : 0)
                    .animation(.spring(duration: 0.4, bounce: isHidden ? 0 : 0.65).delay(isHidden ? 0 : 0.6), value: isShow)

                    Button(action: {}, label: {
                        VStack(spacing: 8) {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .frame(width: 48, height: 48)
                                .overlay(
                                    Image("imessage_logo")
                                        .resizable()
                                        .scaledToFit()
                                )
                                .clipped()
                            Text("Messages")
                                .font(.system(size: 11))
                        }
                    })
                    .foregroundStyle(.white)
                    .offset(y: isShow ? 0 : -24)
                    .opacity(isShow ? 1 : 0)
                    .animation(.spring(duration: 0.4, bounce: isHidden ? 0 : 0.65).delay(isHidden ? 0 : 0.7), value: isShow)

                    Button(action: {}, label: {
                        VStack(spacing: 8) {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .frame(width: 48, height: 48)
                                .overlay(
                                    Image("whatsapp_logo")
                                        .resizable()
                                        .scaledToFit()
                                )
                                .clipped()
                            Text("WhatsApp")
                                .font(.system(size: 11))
                        }
                    })
                    .foregroundStyle(.white)
                    .offset(y: isShow ? 0 : -24)
                    .opacity(isShow ? 1 : 0)
                    .animation(.spring(duration: 0.4, bounce: isHidden ? 0 : 0.65).delay(isHidden ? 0 : 0.8), value: isShow)

                    Button(action: {}, label: {
                        VStack(spacing: 8) {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .frame(width: 48, height: 48)
                                .overlay(
                                    Image(systemName: "square.and.arrow.up")
                                        .foregroundColor(Color(hex: 0x181A25))
                                        .font(.system(size: 20, weight: .medium))
                                        .offset(y: -2)
                                )
                            Text("Other")
                                .font(.system(size: 11))
                        }
                    })
                    .foregroundStyle(.white)
                    .offset(y: isShow ? 0 : -24)
                    .opacity(isShow ? 1 : 0)
                    .animation(.spring(duration: 0.4, bounce: isHidden ? 0 : 0.65).delay(isHidden ? 0 : 0.9), value: isShow)
                }
                .padding(.top, 16)

                Spacer()
            }
            .background(
                ZStack {
                    Circle()
                        .foregroundStyle(Color(hex: 0x181A25))
                        .frame(width: screenHeight, height: screenHeight)
                        .scaleEffect(isShow ? 1 : 0)
                }
                .animation(.spring(duration: 0.5), value: isShow)
            )
        }
        .onChange(of: show) { newValue in
            if newValue {
                isHidden = false
                isShow = true
            } else {
                isHidden = true
                isShow = false
            }
        }
    }
}

struct YearlyRecapSharePopupViewPreview: View {
    @State private var isShow = false

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Button(action: { isShow.toggle()}, label: {
                    Text("Press")
                })
            }
            YearlyRecapSharePopupView(shareImage: getShareImage(), show: isShow, onClose: {
                isShow = false
            })
        }
    }

    private func getShareImage() -> UIImage {
        let controller = UIHostingController(rootView: YearlyRecapShareView(
            color: 0xD4C9FF,
            imageType: .clock,
            value: 118,
            title: "fasts logged",
            text: "You’re living life in the intermittent fast lane — solid work!"
        ))
        let view = controller.view
        let targetSize = CGSize(width: 1080, height: 1920)
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .red
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

#Preview {
    YearlyRecapSharePopupViewPreview()
}
