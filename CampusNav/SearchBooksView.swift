import SwiftUI

struct SearchBooksView: View {
    @State private var query = ""

    var results: [Library] {
        guard !query.isEmpty else { return campusLibraries }
        return campusLibraries.filter { lib in
            lib.name.localizedCaseInsensitiveContains(query) ||
            lib.books.contains { $0.localizedCaseInsensitiveContains(query) }
        }
    }

    var body: some View {
        List {
            if results.isEmpty {
                Text("No library or book found for \"\(query)\".").foregroundStyle(.secondary)
            }
            ForEach(results) { lib in
                NavigationLink {
                    LibraryDetailView(library: lib)
                } label: {
                    VStack(alignment: .leading) {
                        Text(lib.name).font(.headline)
                        Text(lib.books.joined(separator: ", "))
                            .font(.caption).foregroundStyle(.secondary)
                    }
                }
            }
        }
        .searchable(text: $query, prompt: "Library or book name")
        .navigationTitle("Search Books")
    }
}
