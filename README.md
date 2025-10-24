# LMS - Learning Management System

A Flutter application built with **Clean Architecture** principles and **feature-based modular structure**.

## ✨ Features

- 🔐 **Authentication System**
  - User Sign In
  - User Sign Up  
  - Persistent Login
  - Sign Out
  - Form Validation

- 🏗️ **Clean Architecture**
  - Domain Layer (Business Logic)
  - Data Layer (Data Management)
  - Presentation Layer (UI)

- 🎯 **State Management**
  - Cubit (flutter_bloc)
  - Reactive UI updates
  - Clean state handling

- 💉 **Dependency Injection**
  - GetIt service locator
  - Decoupled components
  - Easy testing

- 🌐 **Networking with Dio**
  - Interceptors for logging
  - Advanced error handling
  - Request/Response transformation
  - Timeout configuration

## 📁 Project Structure

```
lib/
├── core/                       # Shared functionality
│   ├── errors/                # Exceptions & Failures
│   ├── network/               # API Client & Network Info
│   ├── usecases/              # Base UseCase class
│   ├── utils/                 # Utilities
│   ├── constants/             # App constants
│   └── dependency_injection.dart
│
└── features/                  # Feature modules
    └── auth/                  # Authentication feature
        ├── domain/            # Business logic
        │   ├── entities/
        │   ├── repositories/
        │   └── usecases/
        ├── data/              # Data operations
        │   ├── models/
        │   ├── datasources/
        │   │   ├── remote/
        │   │   └── local/
        │   └── repositories_impl/
        └── presentation/      # UI
            ├── cubit/
            ├── screens/
            └── widgets/
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.5.0 or higher)
- Dart SDK (3.5.0 or higher)

### Installation

1. **Clone the repository**
   ```bash
   cd LMS
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| flutter_bloc | ^8.1.3 | State management |
| get_it | ^7.6.4 | Dependency injection |
| dartz | ^0.10.1 | Functional programming |
| equatable | ^2.0.5 | Value equality |
| dio | ^5.4.0 | HTTP client with interceptors |
| shared_preferences | ^2.2.2 | Local storage |

## 🏗️ Architecture

This project follows **Clean Architecture** with three distinct layers:

### Domain Layer
- Contains business logic and entities
- No external dependencies
- Pure Dart code

### Data Layer  
- Implements repository interfaces
- Handles API calls and local storage
- Converts between models and entities

### Presentation Layer
- UI components and screens
- State management with Cubit
- Depends only on domain layer

For detailed architecture documentation, see [ARCHITECTURE.md](ARCHITECTURE.md)

## 🎨 Screens

### Login Screen
- Email and password validation
- Error handling
- Loading states
- Navigation to sign up

### Sign Up Screen
- Full name, email, password fields
- Password confirmation
- Form validation
- Automatic login after signup

### Home Screen
- User profile display
- Account information
- Sign out functionality

## 🧪 Testing (Coming Soon)

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## 📝 Code Style

This project follows the [Effective Dart](https://dart.dev/guides/language/effective-dart) style guide and uses:
- `flutter_lints` for linting
- Consistent naming conventions
- Comprehensive documentation

## 🔧 Configuration

### API Configuration
Update `lib/core/constants/app_constants.dart`:
```dart
static const String apiBaseUrl = 'YOUR_API_URL';
```

### Network Timeout
```dart
static const Duration apiTimeout = Duration(seconds: 30);
```

## 🎯 Future Enhancements

- [ ] Unit tests
- [ ] Integration tests
- [ ] Course management feature
- [ ] User profile editing
- [ ] Push notifications
- [ ] Offline mode
- [ ] Dark mode

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

Built with ❤️ using Flutter and Clean Architecture

## 🙏 Acknowledgments

- [Clean Architecture by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Bloc Library](https://bloclibrary.dev/)
- [Reso Coder's Clean Architecture Tutorial](https://resocoder.com/flutter-clean-architecture-tdd/)

---

**Happy Coding! 🚀**
