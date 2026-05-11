import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    private let columns = [
        GridItem(.flexible(), spacing: 18),
        GridItem(.flexible(), spacing: 18)
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                AppBackgroundView(
                    topColor: Color(hex: "#0B1020"),
                    bottomColor: Color(hex: "#1D4ED8")
                )

                ScrollView {
                    VStack(alignment: .leading, spacing: 26) {
                        heroSection
                        categoryFilters

                        LazyVGrid(columns: columns, spacing: 18) {
                            ForEach(viewModel.filteredThemes) { theme in
                                NavigationLink(value: theme) {
                                    ThemeCardView(theme: theme)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 18)
                }
            }
            .navigationDestination(for: ThemePack.self) { theme in
                ThemeDetailView(theme: theme)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Theme Catalog")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                        Text("Curated looks for your Home Screen")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundStyle(.white.opacity(0.68))
                    }
                }
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }

    private var heroSection: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Browse standout theme packs built for wallpaper + icon styling.")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .fixedSize(horizontal: false, vertical: true)
                .minimumScaleFactor(0.8)

            if let featuredTheme = viewModel.featuredTheme {
                NavigationLink(value: featuredTheme) {
                    WallpaperArtworkView(theme: featuredTheme, isHeroLayout: false)
                        .frame(height: 210)
                        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                        .overlay(alignment: .bottomLeading) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Featured")
                                    .font(.system(size: 12, weight: .bold, design: .rounded))
                                    .foregroundStyle(.white.opacity(0.72))
                                Text(featuredTheme.name)
                                    .font(.system(size: 26, weight: .bold, design: .rounded))
                                    .foregroundStyle(.white)
                            }
                            .padding(20)
                        }
                }
                .buttonStyle(.plain)
            }
        }
    }

    private var categoryFilters: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(viewModel.categories) { category in
                    Button {
                        viewModel.selectedCategory = category
                    } label: {
                        CategoryChipView(
                            title: category.title,
                            isSelected: viewModel.selectedCategory == category
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.vertical, 4)
        }
    }
}
