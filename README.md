# SmartSign TV App

SmartSign TV Player - Offline-First Digital Signage Player for Android TV

## Overview

SmartSign TV App is the client-side application running on low-end Android TV sticks for displaying dynamic content managed through the SmartSign Web Dashboard.

### Key Features

- **Offline-First Architecture**: Downloads media locally and plays from storage
- **24/7 Playback**: Optimized for continuous looping
- **Device Pairing**: Secure 6-digit pairing code system
- **Real-Time Sync**: Firestore listeners for instant updates
- **Low-End Device Optimization**: Efficient memory management

## Architecture

Follows **Clean Architecture** with strict separation of concerns:

- **Presentation Layer** - UI and Riverpod state management
- **Domain Layer** - Business logic, entities, and use cases
- **Data Layer** - Repositories, datasources, and models

## Getting Started

### Prerequisites

- Flutter 3.10.0 or higher
- Android SDK 21 or higher
- Firebase project configured

### Installation

```bash
git clone https://github.com/Ahmad-ELManaseer03/smartsign-tv.git
cd smartsign-tv
flutter pub get
flutter run
```

### Code Generation

```bash
flutter pub run build_runner build
```

### Running Tests

```bash
flutter test
```

## Documentation

- [ARCHITECTURE.md](./ARCHITECTURE.md) - System architecture and design
- [ENGINEERING_STANDARDS.md](./ENGINEERING_STANDARDS.md) - Coding standards

## Contributing

All contributions must follow the engineering standards. See ENGINEERING_STANDARDS.md for details.

## License

This project is proprietary and confidential.
