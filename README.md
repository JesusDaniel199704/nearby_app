# Nearby Places App

A mobile app developed with Flutter that allows users to find nearby places, filter by categories, and search for specific locations.

## 📋 Features

- 📍 Real-time display of the current location
- 🗺️ Integration with Google Maps
- 🔍 Search for nearby places
- 🏷️ Filter by categories
- 📱 Intuitive user interface
- 🌐 Connectivity monitoring
- 📍 GPS status control

## 🛠 Prerequisites

- **Flutter** 3.0.0 or higher
- **Dart** 2.17.0 or higher
- A Google Maps API key
- **Android Studio** / **VS Code**
- **iOS Simulator** / **Android Emulator**

## 📦 Key Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
  google_maps_flutter: ^2.5.0
  geolocator: ^10.1.0
  connectivity_plus: ^5.0.1
  equatable: ^2.0.5
  flutter_screenutil: ^5.9.0
```
## 🚀 Project Setup

-  git clone https://github.com/JesusDaniel199704/nearby-app.git

### Install dependencies
-  flutter pub get

### Set up Google Maps API key

- Android: Agregar en android/app/src/main/AndroidManifest.xml
- iOS: Agregar en ios/Runner/AppDelegate.swift

### Run the app
  flutter run

## 🏛️ Architecture
  ```lib/
├── features/
│   ├── geolocator/
│   │   ├── domain/
│   │   ├── data/
│   │   └── presentation/
│   └── places/
│       ├── domain/
│       ├── data/
│       └── presentation/
├── core/
│   ├── error/
│   ├── network/
│   └── utils/
└── main.dart
```
## 🌟 Key Features
### Geolocation
  - Get the current location
  - Monitor location changes
  -Check permissions and GPS status

### Place Search
  - Search by name or category
  - Real-time display on the map
  - Filter by available categories
  - 
### User Interface
  - Responsive design
  - Status indicators (loading, error)
  - Interactive filters
  - Autocomplete search
    
## 📲 Usage

  - On opening the app, allow location permissions.
  - The app will display your current location and nearby places.
  - Use the search bar to find specific places.
  - Use filters to view specific categories.
  - Tap on markers to see more information.

## 🤝 Contribution
  - Fork the project.
  - Create a branch for your feature (git checkout -b feature/AmazingFeature).
  - Commit your changes (git commit -m 'Add some AmazingFeature').
  - Push to the branch (git push origin feature/AmazingFeature).
  - Open a Pull Request.

## 📄 License
  - This project is licensed under the MIT License - see the LICENSE.md file for details.


