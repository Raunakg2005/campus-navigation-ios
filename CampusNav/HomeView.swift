import SwiftUI
import MapKit

struct HomeView: View {
    @EnvironmentObject var location: LocationManager
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(center: campusLibraries[0].coordinate,
                           span: MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)))

    var body: some View {
        NavigationStack {
            Map(position: $position) {
                UserAnnotation()
                ForEach(campusLibraries) { lib in
                    Annotation(lib.name, coordinate: lib.coordinate) {
                        Image(systemName: "books.vertical.fill")
                            .padding(6).background(.blue).foregroundStyle(.white).clipShape(Circle())
                    }
                }
            }
            .mapControls { MapUserLocationButton() }
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 8) {
                    if location.isDenied {
                        Text("Location access is unavailable. Enable it in Settings to see distances.")
                            .font(.footnote).foregroundStyle(.red)
                    }
                    HStack {
                        NavigationLink { LibraryListView() } label: {
                            Label("Nearby Libraries", systemImage: "list.bullet").frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        NavigationLink { SearchBooksView() } label: {
                            Label("Search Books", systemImage: "magnifyingglass").frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                    }
                    .controlSize(.large)
                }
                .padding()
                .background(.ultraThinMaterial)
            }
            .navigationTitle("Campus Navigation")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}
