import Foundation
import CoreLocation

struct Library: Identifiable {
    let id = UUID()
    let name: String
    let building: String
    let latitude: Double
    let longitude: Double
    let books: [String]

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    func distance(from location: CLLocation?) -> Double? {
        guard let location else { return nil }
        return location.distance(from: CLLocation(latitude: latitude, longitude: longitude))
    }
}

// Predefined campus dataset
let campusLibraries: [Library] = [
    Library(name: "Central Library", building: "Main Block", latitude: 37.3349, longitude: -122.0090,
            books: ["Clean Code", "The Swift Programming Language", "Operating System Concepts"]),
    Library(name: "Engineering Library", building: "Block A", latitude: 37.3370, longitude: -122.0120,
            books: ["Digital Electronics", "Computer Networks", "Clean Code"]),
    Library(name: "Science Library", building: "Block B", latitude: 37.3320, longitude: -122.0060,
            books: ["Physics Fundamentals", "Organic Chemistry", "Calculus"]),
    Library(name: "Management Library", building: "Block C", latitude: 37.3385, longitude: -122.0050,
            books: ["Principles of Marketing", "Financial Accounting", "Calculus"]),
    Library(name: "Reading Hall", building: "Hostel Area", latitude: 37.3305, longitude: -122.0115,
            books: ["The Swift Programming Language", "Atomic Habits"])
]

func formatDistance(_ meters: Double?) -> String {
    guard let meters else { return "Distance unavailable" }
    return meters < 1000 ? String(format: "%.0f m", meters) : String(format: "%.2f km", meters / 1000)
}
