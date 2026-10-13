import SwiftUI
import MapKit

struct DirectionsView: View {
    @EnvironmentObject var location: LocationManager
    let library: Library
    @State private var route: MKRoute?
    @State private var message = "Calculating route..."
    @State private var position: MapCameraPosition = .automatic

    var body: some View {
        VStack {
            Map(position: $position) {
                UserAnnotation()
                Marker(library.name, systemImage: "books.vertical.fill", coordinate: library.coordinate)
                if let route {
                    MapPolyline(route).stroke(.blue, lineWidth: 5)
                }
            }
            if let route {
                Text("\(formatDistance(route.distance)) • \(Int(route.expectedTravelTime / 60)) min walk")
                    .font(.headline).padding()
            } else {
                Text(message).foregroundStyle(.secondary).padding()
            }
        }
        .navigationTitle("Directions")
        .task { await getRoute() }
    }

    func getRoute() async {
        guard let userLocation = location.location else {
            message = "Location unavailable. Cannot calculate route."
            return
        }
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation.coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: library.coordinate))
        request.transportType = .walking

        do {
            let response = try await MKDirections(request: request).calculate()
            route = response.routes.first
            if let rect = route?.polyline.boundingMapRect {
                position = .rect(rect)
            }
        } catch {
            message = "Could not find a route."
        }
    }
}
