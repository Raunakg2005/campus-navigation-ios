import SwiftUI

@main
struct CampusNavApp: App {
    @StateObject private var location = LocationManager()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(location)
        }
    }
}
