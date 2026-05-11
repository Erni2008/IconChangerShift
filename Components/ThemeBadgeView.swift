import SwiftUI

struct ThemeBadgeView: View {
    let isPremium: Bool

    var body: some View {
        Text("Free")
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundStyle(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(Color.white.opacity(0.18))
            )
    }
}
