import SwiftUI

struct ActionButton: View {
    let title: String
    let systemImage: String
    var isPrimary: Bool = true
    var isLoading: Bool = false

    var body: some View {
        HStack(spacing: 10) {
            if isLoading {
                ProgressView()
                    .tint(isPrimary ? .black : .white)
            } else {
                Image(systemName: systemImage)
            }

            Text(title)
        }
        .font(.system(size: 16, weight: .semibold, design: .rounded))
        .foregroundStyle(isPrimary ? Color.black : Color.white)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(isPrimary ? Color.white : Color.white.opacity(0.08))
        )
        .overlay {
            if !isPrimary {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.white.opacity(0.08), lineWidth: 1)
            }
        }
    }
}
