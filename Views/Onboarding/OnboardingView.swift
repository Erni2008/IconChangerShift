import SwiftUI

struct OnboardingView: View {
    @AppStorage(AppStorageKeys.didCompleteOnboarding) private var didCompleteOnboarding = false

    var body: some View {
        GeometryReader { proxy in
            let compactHeight = proxy.size.height < 750
            let compactWidth = proxy.size.width < 380

            ZStack {
                AppBackgroundView(
                    topColor: Color(hex: "#111827"),
                    bottomColor: Color(hex: "#4F46E5")
                )

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: compactHeight ? 22 : 28) {
                        VStack(alignment: .leading, spacing: 18) {
                            Text("Discover wallpapers, icons, and widgets for your iPhone.")
                                .font(.system(size: compactWidth ? 34 : 42, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                                .minimumScaleFactor(0.75)

                            Text("Browse theme packs, preview polished icon styles, save your favorites, and follow a clean Shortcuts-based installation flow.")
                                .font(.system(size: compactWidth ? 16 : 18, weight: .medium, design: .rounded))
                                .foregroundStyle(.white.opacity(0.76))
                        }

                        HStack(spacing: 14) {
                            ThemeBadgeView(isPremium: false)
                            ThemeBadgeView(isPremium: false)
                        }

                        VStack(spacing: 16) {
                            HStack(spacing: 16) {
                                samplePreview(symbol: "moon.stars.fill", accent: "#A78BFA", compact: compactHeight)
                                samplePreview(symbol: "paintpalette.fill", accent: "#22D3EE", compact: compactHeight)
                                samplePreview(symbol: "bolt.fill", accent: "#FB7185", compact: compactHeight)
                            }

                            WallpaperArtworkView(theme: MockThemeData.themes[0], isHeroLayout: false)
                                .frame(height: compactHeight ? 170 : 200)
                                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        }

                        Button {
                            didCompleteOnboarding = true
                        } label: {
                            ActionButton(title: "Get Started", systemImage: "arrow.right", isPrimary: true)
                        }
                        .buttonStyle(.plain)
                    }
                    .frame(minHeight: proxy.size.height, alignment: .center)
                    .padding(.horizontal, 24)
                    .padding(.vertical, compactHeight ? 24 : 32)
                }
            }
        }
    }

    private func samplePreview(symbol: String, accent: String, compact: Bool) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [Color(hex: accent), Color.white.opacity(0.2)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            Image(systemName: symbol)
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.white)
        }
        .frame(height: compact ? 92 : 110)
    }
}
