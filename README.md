# Campus Navigation

A SwiftUI app for finding your way around campus. It shows nearby libraries on a map, lists them by distance, lets you search for a book and see which library has it, and gives walking directions to the library you pick.

![Swift](https://img.shields.io/badge/Swift-5.9-orange?logo=swift)
![iOS](https://img.shields.io/badge/iOS-17%2B-blue?logo=apple)
![SwiftUI](https://img.shields.io/badge/UI-SwiftUI-informational)
![MapKit](https://img.shields.io/badge/Maps-MapKit-success)

## Features

- **Campus map**: shows your current location and a marker for every library
- **Nearby libraries**: listed from nearest to farthest
- **Library details**: name, location, distance and available books
- **Search**: find a library or book by name
- **Directions**: walking route drawn on the map, with distance and estimated time
- **Error handling**: shows a message when location access is off or no match is found

## Tech Stack

| Layer      | Technology                                         |
|------------|----------------------------------------------------|
| UI         | SwiftUI (`NavigationStack`, `List`, `.searchable`) |
| Maps       | MapKit (`Map`, `Annotation`, `MapPolyline`)        |
| Location   | Core Location (`CLLocationManager`)                |
| Routing    | `MKDirections`                                     |

## Architecture

```
CampusNav/
├── CampusNavApp.swift       # App entry point, injects LocationManager
├── Library.swift            # Library model and sample campus data
├── LocationManager.swift    # Location permission and updates
├── HomeView.swift           # Map with library annotations
├── LibraryListView.swift    # Libraries sorted by distance
├── LibraryDetailView.swift  # Library info and available books
├── SearchBooksView.swift    # Search libraries and books
└── DirectionsView.swift     # Walking route to a library
```

## Getting Started

**Requirements:** Xcode 15+ · iOS 17+

```bash
git clone https://github.com/Raunakg2005/campus-navigation-ios.git
cd campus-navigation-ios
open CampusNav.xcodeproj
```

Choose an iPhone simulator and press **⌘R**. To give the simulator a location, go to **Features → Location → Apple**. The sample libraries are placed around that spot.

## Author

**Raunak Kumar Gupta**, Roll No. 16010123250

## License

Released under the MIT License.
