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

// Somaiya Vidyavihar campus, Mumbai (approximate coordinates)
let campusLibraries: [Library] = [
    Library(name: "KJSCE Library", building: "K J Somaiya College of Engineering", latitude: 19.0728, longitude: 72.8999,
            books: ["Clean Code", "The Swift Programming Language", "Operating System Concepts", "Computer Networks"]),
    Library(name: "SIMSR Library", building: "K J Somaiya Institute of Management", latitude: 19.0745, longitude: 72.8993,
            books: ["Principles of Marketing", "Financial Accounting", "Business Analytics"]),
    Library(name: "Science College Library", building: "K J Somaiya College of Science & Commerce", latitude: 19.0722, longitude: 72.8978,
            books: ["Physics Fundamentals", "Organic Chemistry", "Calculus"]),
    Library(name: "Arts College Library", building: "K J Somaiya College of Arts & Commerce", latitude: 19.0716, longitude: 72.8988,
            books: ["Indian Economy", "Financial Accounting", "English Literature"]),
    Library(name: "S K Somaiya College Library", building: "S K Somaiya College", latitude: 19.0740, longitude: 72.8975,
            books: ["Mass Communication", "Calculus", "Atomic Habits"]),
    Library(name: "Education College Library", building: "K J Somaiya College of Education", latitude: 19.0710, longitude: 72.8995,
            books: ["Educational Psychology", "Teaching Methods", "Atomic Habits"])
]

func formatDistance(_ meters: Double?) -> String {
    guard let meters else { return "Distance unavailable" }
    return meters < 1000 ? String(format: "%.0f m", meters) : String(format: "%.2f km", meters / 1000)
}
