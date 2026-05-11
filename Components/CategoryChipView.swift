import SwiftUI

struct CategoryChipView: View {
    let title: String
    let isSelected: Bool

    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .semibold, design: .rounded))
            .foregroundStyle(isSelected ? Color.black : Color.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule()
                    .fill(isSelected ? Color.white : Color.white.opacity(0.08))
            )
            .overlay {
                Capsule()
                    .stroke(Color.white.opacity(isSelected ? 0 : 0.08), lineWidth: 1)
            }
    }
}
