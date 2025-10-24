# Clean Architecture - Flutter LMS Project

This project follows **Clean Architecture** principles with a **feature-based modular structure**. Each feature is organized into three distinct layers: Domain, Data, and Presentation.

## 🏗️ Project Structure

```
lib/
├── core/                                    # Core functionality shared across features
│   ├── errors/
│   │   ├── exceptions.dart                 # Data layer exceptions
│   │   └── failures.dart                   # Domain layer failures
│   ├── network/
│   │   ├── api_client.dart                 # Dio HTTP client wrapper
│   │   └── network_info.dart               # Network connectivity checker
│   ├── usecases/
│   │   └── usecase.dart                    # Base UseCase class
│   ├── utils/
│   │   └── input_validator.dart            # Input validation utilities
│   ├── constants/
│   │   └── app_constants.dart              # App-wide constants
│   └── dependency_injection.dart           # Dependency injection setup
│
└── features/                               # Feature modules
    └── auth/                               # Authentication feature
        ├── domain/                         # Business logic layer
        │   ├── entities/
        │   │   └── user_entity.dart        # Pure business object
        │   ├── repositories/
        │   │   └── auth_repository.dart    # Repository interface
        │   └── usecases/
        │       ├── sign_in.dart            # Sign in use case
        │       ├── sign_up.dart            # Sign up use case
        │       ├── sign_out.dart           # Sign out use case
        │       └── get_current_user.dart   # Get current user use case
        │
        ├── data/                           # Data layer
        │   ├── models/
        │   │   └── user_model.dart         # Data model with JSON serialization
        │   ├── datasources/
        │   │   ├── remote/
        │   │   │   └── auth_remote_data_source.dart  # API calls
        │   │   └── local/
        │   │       └── auth_local_data_source.dart   # Local storage
        │   └── repositories_impl/
        │       └── auth_repository_impl.dart         # Repository implementation
        │
        └── presentation/                   # UI layer
            ├── cubit/
            │   ├── auth_cubit.dart         # State management logic
            │   └── auth_state.dart         # State definitions
            ├── screens/
            │   ├── login_screen.dart       # Login UI
            │   ├── signup_screen.dart      # Sign up UI
            │   └── home_screen.dart        # Home UI
            └── widgets/
                ├── auth_text_field.dart    # Reusable text field
                └── primary_button.dart     # Reusable button
```

## 📐 Clean Architecture Layers

### 1. Domain Layer (Business Logic)
**Location:** `features/{feature_name}/domain/`

The innermost layer containing business logic and entities. It has **NO dependencies** on other layers.

**Components:**
- **Entities:** Pure Dart classes representing business objects
- **Repositories:** Abstract interfaces defining data operations
- **Use Cases:** Single-responsibility classes for business logic

**Example:**
```dart
// Entity
class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  // ...
}

// Repository Interface
abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signIn({...});
}

// Use Case
class SignIn implements UseCase<UserEntity, SignInParams> {
  final AuthRepository repository;
  
  Future<Either<Failure, UserEntity>> call(SignInParams params) async {
    return await repository.signIn(...);
  }
}
```

### 2. Data Layer (Data Management)
**Location:** `features/{feature_name}/data/`

Handles data operations and implements repository interfaces from the domain layer.

**Components:**
- **Models:** Extend entities with serialization capabilities
- **Data Sources:**
  - **Remote:** API calls using Dio, network operations
  - **Local:** Cache, SharedPreferences, local database
- **Repository Implementations:** Concrete implementations of repository interfaces

**Example:**
```dart
// Model
class UserModel extends UserEntity {
  factory UserModel.fromJson(Map<String, dynamic> json) {...}
  Map<String, dynamic> toJson() {...}
}

// Remote Data Source
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;
  
  Future<UserModel> signIn({...}) async {
    await apiClient.post('/auth/login', {...});
    return UserModel.fromJson(userData);
  }
}

// Repository Implementation
class AuthRepositoryImpl implements AuthRepository {
  Future<Either<Failure, UserEntity>> signIn({...}) async {
    try {
      final user = await remoteDataSource.signIn(...);
      await localDataSource.cacheUser(user);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
```

### 3. Presentation Layer (UI)
**Location:** `features/{feature_name}/presentation/`

Handles UI and state management. Depends on the domain layer only.

**Components:**
- **Cubit/Bloc:** State management logic
- **States:** State definitions (loading, success, error, etc.)
- **Screens:** Full-page UI components
- **Widgets:** Reusable UI components

**Example:**
```dart
// Cubit
class AuthCubit extends Cubit<AuthState> {
  final SignIn signInUseCase;
  
  Future<void> signIn({...}) async {
    emit(AuthLoading());
    final result = await signInUseCase(SignInParams(...));
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }
}

// Screen
class LoginScreen extends StatelessWidget {
  void _handleLogin() {
    context.read<AuthCubit>().signIn(...);
  }
}
```

## 🌐 Network Layer with Dio

### API Client Configuration

The `ApiClient` class wraps Dio with custom configuration:

```dart
class ApiClient {
  final Dio dio;
  
  ApiClient({required this.dio, this.baseUrl = 'https://api.example.com'}) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    
    // Add logging interceptor
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }
}
```

### HTTP Methods

All standard HTTP methods are supported:

```dart
// GET request
final data = await apiClient.get('/users');

// POST request
final user = await apiClient.post('/auth/login', {
  'email': email,
  'password': password,
});

// PUT request
await apiClient.put('/users/$id', userData);

// PATCH request
await apiClient.patch('/users/$id', partialData);

// DELETE request
await apiClient.delete('/users/$id');
```

### Error Handling with Dio

Dio errors are automatically caught and converted to custom exceptions:

```dart
Exception _handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return NetworkException('Connection timeout');
      
    case DioExceptionType.badResponse:
      return ServerException('Server error: ${error.response?.data}');
      
    case DioExceptionType.connectionError:
      return NetworkException('No internet connection');
      
    case DioExceptionType.cancel:
      return NetworkException('Request cancelled');
      
    default:
      return NetworkException('Network error: ${error.message}');
  }
}
```

### Interceptors

Dio interceptors can be added for:
- **Logging:** Debug request/response data
- **Authentication:** Add auth tokens to headers
- **Retry Logic:** Automatically retry failed requests
- **Error Transformation:** Convert errors to custom format

Example:
```dart
dio.interceptors.add(
  InterceptorsWrapper(
    onRequest: (options, handler) {
      // Add auth token
      options.headers['Authorization'] = 'Bearer $token';
      return handler.next(options);
    },
    onResponse: (response, handler) {
      // Process response
      return handler.next(response);
    },
    onError: (error, handler) {
      // Handle errors
      return handler.next(error);
    },
  ),
);
```

## 🎯 Key Principles

### 1. Dependency Rule
Dependencies flow inward: Presentation → Data → Domain

- Domain layer has **zero external dependencies**
- Data layer depends only on Domain
- Presentation layer depends only on Domain

### 2. Separation of Concerns
Each layer has a single responsibility:
- **Domain:** Business rules and logic
- **Data:** Data retrieval and persistence
- **Presentation:** UI and user interaction

### 3. Testability
Each layer can be tested independently:
- Domain: Test business logic with mock repositories
- Data: Test data operations with mock data sources
- Presentation: Test UI with mock use cases

## 🔧 Dependency Injection

Using **GetIt** for dependency injection:

```dart
// lib/core/dependency_injection.dart
final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // External - Dio
  sl.registerLazySingleton<Dio>(() => Dio());
  
  // Core - API Client
  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(dio: sl<Dio>()),
  );
  
  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiClient: sl<ApiClient>()),
  );
  
  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl<AuthRemoteDataSource>(),
      localDataSource: sl<AuthLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );
  
  // Use Cases
  sl.registerLazySingleton(() => SignIn(sl<AuthRepository>()));
  
  // Cubits
  sl.registerFactory(() => AuthCubit(signInUseCase: sl<SignIn>()));
}
```

## 📦 Dependencies

```yaml
dependencies:
  flutter_bloc: ^8.1.3          # State management
  get_it: ^7.6.4                # Dependency injection
  dartz: ^0.10.1                # Functional programming (Either)
  equatable: ^2.0.5             # Value equality
  dio: ^5.4.0                   # HTTP client
  shared_preferences: ^2.2.2    # Local storage
```

## 🚀 Getting Started

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run the app:**
   ```bash
   flutter run
   ```

3. **Test credentials (Demo):**
   - Email: Any valid email format
   - Password: Minimum 6 characters

## 🎨 Features

### Auth Feature
Complete authentication system with:
- ✅ User Sign In
- ✅ User Sign Up
- ✅ User Sign Out
- ✅ Persistent Authentication
- ✅ Form Validation
- ✅ Error Handling
- ✅ Loading States
- ✅ Network Error Handling with Dio

## 📝 Adding a New Feature

To add a new feature (e.g., "courses"), follow this structure:

```
lib/features/courses/
├── domain/
│   ├── entities/
│   │   └── course_entity.dart
│   ├── repositories/
│   │   └── course_repository.dart
│   └── usecases/
│       ├── get_courses.dart
│       └── enroll_in_course.dart
├── data/
│   ├── models/
│   │   └── course_model.dart
│   ├── datasources/
│   │   ├── remote/
│   │   │   └── course_remote_data_source.dart
│   │   └── local/
│   │       └── course_local_data_source.dart
│   └── repositories_impl/
│       └── course_repository_impl.dart
└── presentation/
    ├── cubit/
    │   ├── course_cubit.dart
    │   └── course_state.dart
    ├── screens/
    │   └── courses_screen.dart
    └── widgets/
        └── course_card.dart
```

## 🧪 Testing Strategy

```
test/
├── core/
│   └── network/
│       └── api_client_test.dart
└── features/
    └── auth/
        ├── domain/
        │   └── usecases/
        │       └── sign_in_test.dart
        ├── data/
        │   ├── models/
        │   │   └── user_model_test.dart
        │   └── repositories/
        │       └── auth_repository_impl_test.dart
        └── presentation/
            └── cubit/
                └── auth_cubit_test.dart
```

## 🔐 Error Handling

### Domain Layer: Failures
```dart
abstract class Failure {
  final String message;
}

class ServerFailure extends Failure {...}
class NetworkFailure extends Failure {...}
class CacheFailure extends Failure {...}
```

### Data Layer: Exceptions
```dart
class ServerException implements Exception {...}
class NetworkException implements Exception {...}
class CacheException implements Exception {...}
```

### Either Type
Using `dartz` package for functional error handling:
```dart
Future<Either<Failure, UserEntity>> signIn() async {
  try {
    final user = await dataSource.signIn();
    return Right(user);  // Success
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message));  // Failure
  } on NetworkException catch (e) {
    return Left(NetworkFailure(e.message));  // Network failure
  }
}
```

## 📱 UI Components

### Reusable Widgets
- `AuthTextField`: Custom text input with validation
- `PrimaryButton`: Styled button with loading state

### State Management
Using **Cubit** (simplified Bloc) for state management:
- Clean separation of UI and business logic
- Reactive UI updates
- Easy to test

## 🎓 Best Practices

1. **Keep Domain Pure:** No Flutter/external dependencies in domain layer
2. **Single Responsibility:** Each class has one reason to change
3. **Dependency Inversion:** Depend on abstractions, not concretions
4. **Immutability:** Use `const` constructors and `final` fields
5. **Null Safety:** Leverage Dart's null safety features
6. **Code Documentation:** Document public APIs and complex logic
7. **Error Handling:** Use Either type for explicit error handling
8. **Dio Interceptors:** Use for cross-cutting concerns (logging, auth, etc.)

## 🌟 Dio Advantages

- **Interceptors:** Built-in support for request/response modification
- **Request Cancellation:** Cancel ongoing requests
- **File Upload/Download:** Built-in support with progress tracking
- **Timeout Configuration:** Easy timeout configuration
- **Better Error Handling:** Rich error information
- **FormData Support:** Native multipart/form-data support
- **Transformer:** Custom data transformation
- **HttpClientAdapter:** Use custom HTTP client if needed

## 📚 Resources

- [Clean Architecture by Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Clean Architecture Guide](https://resocoder.com/flutter-clean-architecture-tdd/)
- [Bloc Library Documentation](https://bloclibrary.dev/)
- [Dio Documentation](https://pub.dev/packages/dio)

---

**Built with ❤️ using Clean Architecture principles and Dio HTTP client**

