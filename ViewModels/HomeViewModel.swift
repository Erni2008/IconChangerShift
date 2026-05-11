import Combine
import Foundation

final class HomeViewModel: ObservableObject {
    private let themes: [ThemePack]
    @Published var selectedCategory: ThemeCategory = .all

    init(repository: ThemeRepository = MockThemeRepository()) {
        self.themes = repository.fetchThemes()
    }

    var categories: [ThemeCategory] {
        ThemeCategory.allCases
    }

    var filteredThemes: [ThemePack] {
        guard selectedCategory != .all else { return themes }
        return themes.filter { $0.category == selectedCategory }
    }

    var featuredTheme: ThemePack? {
        themes.first
    }
}
