import SwiftUI

struct CounterView: View {
    let targetValue: Int
    let isShow: Bool
    @State var value: Int = 0

    var body: some View {
        RollingText(font: .system(size: 80), weight: .black, value: $value)
            .mask(
                LinearGradient(
                    gradient: Gradient(colors: [Color.clear, Color.white, Color.white, Color.white, Color.white, Color.clear]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .onChange(of: isShow) { newValue in
                if newValue {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        value = targetValue
                    }
                }
            }
    }
}

struct RollingText: View {
    var font: Font = .largeTitle
    var weight: Font.Weight = .regular

    @Binding var value: Int
    @State var animationRange: [Int] = []

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<animationRange.count, id: \.self) { index in
                Text("8")
                    .font(font)
                    .fontWeight(weight)
                    .opacity(0)
                    .overlay {
                        GeometryReader { proxy in
                            let size = proxy.size

                            VStack(spacing: 0) {
                                ForEach(0...9, id: \.self) { number in
                                    Text("\(number)")
                                        .font(font)
                                        .fontWeight(weight)
                                        .frame(width: size.width, height: size.height, alignment: .center)
                                        .offset(x: -2)
                                }
                            }
                            .offset(y: -CGFloat(animationRange[index]) * size.height)
                        }
                        .clipped()
                    }
            }
        }
        .onAppear {
            animationRange = Array(repeating: 0, count: "\(value)".count)

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {

            }
        }
        .onChange(of: value) { newValue in
            let extra = "\(value)".count - animationRange.count
            if extra > 0 {
                for _ in 0..<extra {
                    withAnimation(.easeIn(duration: 0.1)) {
                        animationRange.append(0)
                    }
                }
            } else {
                for _ in 0..<(-extra) {
                    withAnimation(.easeIn(duration: 0.1)) {
                        animationRange.removeLast()
                    }
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                updateText()
            }
        }
    }

    func updateText() {
        let stringValue = "\(value)"
        for (index, value) in zip(0..<stringValue.count, stringValue) {

            var fraction = Double(index) * 0.15
            fraction = (fraction > 0.5 ? 0.5 : fraction)

            withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 1 + fraction, blendDuration: 1 + fraction)) {
                animationRange[index] = (String(value) as NSString).integerValue
            }
        }
    }
}

#Preview {
    CounterView(targetValue: 184, isShow: true)
}
