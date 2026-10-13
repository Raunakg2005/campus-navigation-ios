import SwiftUI
import MapKit

struct HomeView: View {
    @EnvironmentObject var location: LocationManager
    @State private var position: MapCameraPosition = .userLocation(fallback: .region(
        MKCoordinateRegion(center: campusLibraries[0].coordinate,
                           span: MKCoordinateSpan(latitudeDelta: 0.012, longitudeDelta: 0.012))))

    var body: some View {
        NavigationStack {
            VStack {
                if location.isDenied {
                    Text("Location access is unavailable. Enable it in Settings to see distances.")
                        .font(.footnote).foregroundStyle(.red).padding(.horizontal)
                }

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

                HStack {
                    NavigationLink("Nearby Libraries") { LibraryListView() }
                        .buttonStyle(.borderedProminent)
                    NavigationLink("Search Books") { SearchBooksView() }
                        .buttonStyle(.bordered)
                }
                .padding()
            }
            .navigationTitle("Campus Navigation")
        }
    }
}
