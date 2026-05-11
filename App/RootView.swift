import SwiftUI

struct RootView: View {
    @AppStorage(AppStorageKeys.didCompleteOnboarding) private var didCompleteOnboarding = false

    var body: some View {
        Group {
            if didCompleteOnboarding {
                HomeView()
            } else {
                OnboardingView()
            }
        }
    }
}
