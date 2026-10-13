import SwiftUI

struct LibraryDetailView: View {
    @EnvironmentObject var location: LocationManager
    let library: Library

    var body: some View {
        List {
            Section("Details") {
                LabeledContent("Name", value: library.name)
                LabeledContent("Location", value: library.building)
                LabeledContent("Distance", value: formatDistance(library.distance(from: location.location)))
            }
            Section("Available Books") {
                ForEach(library.books, id: \.self) { Text($0) }
            }
            Section {
                NavigationLink("Get Directions") { DirectionsView(library: library) }
            }
        }
        .navigationTitle(library.name)
    }
}
