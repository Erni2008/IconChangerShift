import SwiftUI

struct AppBackgroundView: View {
    let topColor: Color
    let bottomColor: Color

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [topColor, bottomColor],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Circle()
                .fill(topColor.opacity(0.45))
                .frame(width: 260, height: 260)
                .blur(radius: 24)
                .offset(x: -120, y: -280)

            Circle()
                .fill(Color.white.opacity(0.12))
                .frame(width: 220, height: 220)
                .blur(radius: 36)
                .offset(x: 140, y: 260)
        }
        .ignoresSafeArea()
    }
}
