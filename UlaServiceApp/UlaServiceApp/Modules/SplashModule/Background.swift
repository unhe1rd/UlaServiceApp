import SwiftUI


struct AnimatedGradientView: View {
    let durationTime: TimeInterval
    @Binding var currentColors: [Color]

    var body: some View {
        LinearGradient(gradient: Gradient(colors: currentColors), startPoint: .top, endPoint: .bottom)
            .animation(Animation.linear(duration: durationTime).repeatForever())
            .onAppear {
                withAnimation{
                    currentColors.reverse()
                }
            }
            .ignoresSafeArea()
    }
}


struct AnimatingGradientBuilder: View {
    @State private var currentColors: [Color]
    private let durationTime: TimeInterval

    init(backgroundColors: [Color], durationTime: TimeInterval) {
        self._currentColors = State(initialValue: backgroundColors)
        self.durationTime = durationTime
    }

    var body: some View {
        ZStack {
            AnimatedGradientView(durationTime: durationTime, currentColors: $currentColors)
        }
    }
}

struct BackgroundView: View {
    @Environment(\.colorScheme) var colorScheme
    var imageOnBackground: Bool
    var durationTime: Int
    var body: some View {
        ZStack{
            if colorScheme == .dark{
                AnimatingGradientBuilder(backgroundColors: [Color.purple, Color.black], durationTime: TimeInterval(durationTime))
            } else {
                AnimatingGradientBuilder(backgroundColors: [Color.purple, Color.mint], durationTime: TimeInterval(durationTime))
            }
            if imageOnBackground == true {
                Image("backgroundImage")
                   .resizable()
                   .frame(width: 393, height: 373)
                   .shadow(color: .white, radius: 5)
            }
        }
    }
}


#Preview {
    BackgroundView(imageOnBackground: true, durationTime: 2)
}
