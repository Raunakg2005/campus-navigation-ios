import SwiftUI

struct LibraryListView: View {
    @EnvironmentObject var location: LocationManager

    var sortedLibraries: [Library] {
        campusLibraries.sorted {
            ($0.distance(from: location.location) ?? 0) < ($1.distance(from: location.location) ?? 0)
        }
    }

    var body: some View {
        List(sortedLibraries) { lib in
            NavigationLink {
                LibraryDetailView(library: lib)
            } label: {
                VStack(alignment: .leading) {
                    Text(lib.name).font(.headline)
                    Text(formatDistance(lib.distance(from: location.location)))
                        .font(.subheadline).foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle("Libraries")
    }
}
