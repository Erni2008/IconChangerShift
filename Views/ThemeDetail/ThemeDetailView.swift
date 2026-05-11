import SwiftUI

struct ThemeDetailView: View {
    @StateObject private var viewModel: ThemeDetailViewModel

    init(theme: ThemePack) {
        _viewModel = StateObject(wrappedValue: ThemeDetailViewModel(theme: theme))
    }

    private let columns = [
        GridItem(.adaptive(minimum: 84, maximum: 110), spacing: 14)
    ]

    var body: some View {
        ZStack {
            AppBackgroundView(
                topColor: Color(hex: viewModel.theme.palette.backgroundHex),
                bottomColor: Color(hex: viewModel.theme.palette.secondaryHex)
            )

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    ZStack {
                        WallpaperArtworkView(theme: viewModel.theme, isHeroLayout: false)
                            .frame(height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 34, style: .continuous))
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text(viewModel.theme.name)
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                                .lineLimit(2)
                                .minimumScaleFactor(0.75)

                            Spacer()

                            ThemeBadgeView(isPremium: false)
                        }

                        Text(viewModel.theme.category.title)
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .tracking(1.6)
                            .foregroundStyle(.white.opacity(0.68))

                        Text(viewModel.theme.description)
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundStyle(.white.opacity(0.76))
                    }

                    actionButtons

                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("App Icons")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)

                            Spacer()

                            NavigationLink {
                                IconGalleryView(theme: viewModel.theme)
                            } label: {
                                Text("Open Gallery")
                                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                                    .foregroundStyle(.white)
                            }
                        }

                        LazyVGrid(columns: columns, spacing: 14) {
                            ForEach(viewModel.theme.icons) { icon in
                                VStack(spacing: 10) {
                                    AppIconArtworkView(icon: icon, theme: viewModel.theme, side: 88)
                                    Text(icon.appName)
                                        .font(.system(size: 13, weight: .medium, design: .rounded))
                                        .foregroundStyle(.white.opacity(0.76))
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                }
                .padding(20)
            }
        }
        .navigationTitle("Theme Detail")
        .navigationBarTitleDisplayMode(.inline)
        .alert(
            viewModel.alert?.title ?? "",
            isPresented: Binding(
                get: { viewModel.alert != nil },
                set: { shouldShow in
                    if !shouldShow {
                        viewModel.alert = nil
                    }
                }
            ),
            actions: {
                Button("OK") {
                    viewModel.alert = nil
                }
            },
            message: {
                Text(viewModel.alert?.message ?? "")
            }
        )
    }

    private var actionButtons: some View {
        VStack(spacing: 12) {
            Button {
                Task {
                    await viewModel.saveWallpaper()
                }
            } label: {
                ActionButton(
                    title: "Save Wallpaper",
                    systemImage: "square.and.arrow.down",
                    isPrimary: true,
                    isLoading: viewModel.isSaving
                )
            }
            .buttonStyle(.plain)

            Button {
                Task {
                    await viewModel.saveAllIcons()
                }
            } label: {
                ActionButton(
                    title: "Save Icons",
                    systemImage: "photo.stack",
                    isPrimary: false,
                    isLoading: false
                )
            }
            .buttonStyle(.plain)

            NavigationLink {
                InstallationGuideView()
            } label: {
                ActionButton(
                    title: "Installation Guide",
                    systemImage: "list.number",
                    isPrimary: false,
                    isLoading: false
                )
            }
            .buttonStyle(.plain)
        }
    }
}
