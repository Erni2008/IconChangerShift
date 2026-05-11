import SwiftUI

struct ThemeCardView: View {
    let theme: ThemePack

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            WallpaperArtworkView(theme: theme, isHeroLayout: false)
                .frame(height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .overlay(alignment: .topTrailing) {
                    ThemeBadgeView(isPremium: false)
                        .padding(12)
                }

            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(theme.name)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundStyle(.white)

                        Text(theme.category.title)
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundStyle(.white.opacity(0.72))
                    }

                    Spacer()
                }

                HStack(spacing: 8) {
                    ForEach(theme.icons.prefix(4)) { icon in
                        AppIconArtworkView(icon: icon, theme: theme, side: 52)
                    }

                    Spacer()
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(Color.white.opacity(0.08))
                .overlay {
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .stroke(Color.white.opacity(0.08), lineWidth: 1)
                }
        )
    }
}
