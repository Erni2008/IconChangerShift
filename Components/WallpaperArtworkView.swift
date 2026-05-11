import SwiftUI

struct WallpaperArtworkView: View {
    let theme: ThemePack
    let isHeroLayout: Bool

    private var gradientColors: [Color] {
        theme.wallpaper.gradientHexes.map(Color.init(hex:))
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: gradientColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Circle()
                .fill(Color(hex: theme.palette.accentHex).opacity(0.34))
                .frame(width: isHeroLayout ? 420 : 160, height: isHeroLayout ? 420 : 160)
                .blur(radius: isHeroLayout ? 40 : 18)
                .offset(x: isHeroLayout ? 190 : 80, y: isHeroLayout ? -260 : -60)

            Circle()
                .fill(Color.white.opacity(0.14))
                .frame(width: isHeroLayout ? 260 : 110, height: isHeroLayout ? 260 : 110)
                .blur(radius: isHeroLayout ? 34 : 16)
                .offset(x: isHeroLayout ? -160 : -40, y: isHeroLayout ? 260 : 70)

            VStack(alignment: .leading, spacing: isHeroLayout ? 16 : 8) {
                HStack {
                    Image(systemName: theme.palette.symbolName)
                        .font(.system(size: isHeroLayout ? 28 : 18, weight: .bold))
                    Spacer()
                }
                .foregroundStyle(Color.white.opacity(0.92))

                Spacer()

                VStack(alignment: .leading, spacing: isHeroLayout ? 8 : 4) {
                    Text(theme.wallpaper.title)
                        .font(.system(size: isHeroLayout ? 48 : 24, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)

                    Text(theme.wallpaper.subtitle.uppercased())
                        .font(.system(size: isHeroLayout ? 18 : 11, weight: .medium, design: .rounded))
                        .tracking(isHeroLayout ? 2.6 : 1.8)
                        .foregroundStyle(Color.white.opacity(0.82))
                }

                if isHeroLayout {
                    HStack(spacing: 12) {
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(Color.white.opacity(0.16))
                            .frame(width: 130, height: 56)
                            .overlay {
                                Text("THEME")
                                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                                    .foregroundStyle(.white)
                            }

                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(Color.black.opacity(0.18))
                            .frame(width: 130, height: 56)
                            .overlay {
                                Text("WALLPAPER")
                                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                                    .foregroundStyle(.white)
                            }
                    }
                }
            }
            .padding(isHeroLayout ? 40 : 20)
        }
    }
}
