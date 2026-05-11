import SwiftUI

struct AppIconArtworkView: View {
    let icon: AppIconItem
    let theme: ThemePack
    let side: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: side * 0.26, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(hex: icon.accentHex),
                            Color(hex: theme.palette.secondaryHex),
                            Color(hex: theme.palette.backgroundHex)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            RoundedRectangle(cornerRadius: side * 0.26, style: .continuous)
                .stroke(Color.white.opacity(0.18), lineWidth: 1)

            VStack(spacing: side * 0.08) {
                Image(systemName: icon.symbolName)
                    .font(.system(size: side * 0.3, weight: .bold))
                    .foregroundStyle(.white)

                if side >= 84 {
                    Text(icon.initials)
                        .font(.system(size: side * 0.12, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white.opacity(0.72))
                }
            }
        }
        .frame(width: side, height: side)
        .shadow(color: Color.black.opacity(0.2), radius: 16, y: 10)
    }
}
