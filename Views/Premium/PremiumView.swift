import SwiftUI

struct PremiumView: View {
    @StateObject private var viewModel = PremiumViewModel()
    @AppStorage(AppStorageKeys.isPremiumUnlocked) private var isPremiumUnlocked = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            AppBackgroundView(
                topColor: Color(hex: "#140F2D"),
                bottomColor: Color(hex: "#EF4444")
            )

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Go Premium")
                            .font(.system(size: 38, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)

                        Text("A mock paywall for the MVP. This is ready for StoreKit 2 wiring later without making unsupported claims today.")
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                            .foregroundStyle(.white.opacity(0.76))
                    }

                    WallpaperArtworkView(theme: viewModel.heroTheme, isHeroLayout: false)
                        .frame(height: 220)
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))

                    VStack(spacing: 14) {
                        ForEach(viewModel.features) { feature in
                            HStack(spacing: 14) {
                                Image(systemName: feature.symbolName)
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundStyle(.white)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(feature.title)
                                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                                        .foregroundStyle(.white)

                                    Text(feature.detail)
                                        .font(.system(size: 13, weight: .medium, design: .rounded))
                                        .foregroundStyle(.white.opacity(0.7))
                                        .fixedSize(horizontal: false, vertical: true)
                                }

                                Spacer(minLength: 0)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(16)
                            .background(
                                RoundedRectangle(cornerRadius: 22, style: .continuous)
                                    .fill(Color.white.opacity(0.08))
                            )
                        }
                    }

                    VStack(spacing: 12) {
                        Button {
                            isPremiumUnlocked = true
                            dismiss()
                        } label: {
                            ActionButton(
                                title: isPremiumUnlocked ? "Premium Unlocked" : "Unlock Premium (Mock)",
                                systemImage: "crown.fill",
                                isPrimary: true,
                                isLoading: false
                            )
                        }
                        .buttonStyle(.plain)

                        Text("No real payments are processed in this MVP.")
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundStyle(.white.opacity(0.64))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .padding(20)
            }
        }
        .navigationTitle("Premium")
        .navigationBarTitleDisplayMode(.inline)
    }
}
