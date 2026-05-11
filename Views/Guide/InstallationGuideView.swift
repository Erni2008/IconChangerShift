import SwiftUI

struct InstallationGuideView: View {
    private let steps = MockThemeData.installationSteps

    var body: some View {
        ZStack {
            AppBackgroundView(
                topColor: Color(hex: "#111827"),
                bottomColor: Color(hex: "#4338CA")
            )

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text("Install Custom Icons")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)

                    Text("iOS does not allow apps to replace other app icons automatically. Use this Shortcuts guide to create custom Home Screen icons safely.")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundStyle(.white.opacity(0.74))

                    ForEach(steps) { step in
                        InstallationStepCard(step: step)
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Important")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)

                        Text("This app can save wallpapers and icon artwork to Photos. It cannot automatically change your iPhone wallpaper or replace icons for other installed apps.")
                            .font(.system(size: 15, weight: .medium, design: .rounded))
                            .foregroundStyle(.white.opacity(0.72))
                    }
                    .padding(18)
                    .background(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(Color.white.opacity(0.08))
                    )
                }
                .padding(20)
            }
        }
        .navigationTitle("Guide")
        .navigationBarTitleDisplayMode(.inline)
    }
}
