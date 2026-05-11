import SwiftUI

struct IconGalleryView: View {
    let theme: ThemePack

    @StateObject private var viewModel: ThemeDetailViewModel

    private let columns = [
        GridItem(.adaptive(minimum: 104, maximum: 140), spacing: 16)
    ]

    init(theme: ThemePack) {
        self.theme = theme
        _viewModel = StateObject(wrappedValue: ThemeDetailViewModel(theme: theme))
    }

    var body: some View {
        ZStack {
            AppBackgroundView(
                topColor: Color(hex: theme.palette.backgroundHex),
                bottomColor: Color(hex: theme.palette.primaryHex)
            )

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Icon Gallery")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .minimumScaleFactor(0.8)

                        Text("Save one icon at a time or save the complete set for Shortcuts setup.")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundStyle(.white.opacity(0.72))
                    }

                    Button {
                        Task {
                            await viewModel.saveAllIcons()
                        }
                    } label: {
                        ActionButton(
                            title: "Save All Icons",
                            systemImage: "tray.and.arrow.down.fill",
                            isPrimary: true,
                            isLoading: viewModel.isSaving
                        )
                    }
                    .buttonStyle(.plain)

                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(theme.icons) { icon in
                            VStack(spacing: 12) {
                                AppIconArtworkView(icon: icon, theme: theme, side: 104)

                                VStack(spacing: 4) {
                                    Text(icon.appName)
                                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                                        .foregroundStyle(.white)

                                    Button("Save") {
                                        Task {
                                            await viewModel.saveIcon(icon)
                                        }
                                    }
                                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                                    .foregroundStyle(Color.black)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Capsule().fill(Color.white))
                                }
                            }
                            .padding(14)
                            .frame(maxWidth: .infinity)
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
                }
                .padding(20)
            }
        }
        .navigationTitle(theme.name)
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
}
