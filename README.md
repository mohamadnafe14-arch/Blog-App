# 📝 Blog App

A modern, feature-rich Flutter blog application built with Clean Architecture principles, BLoC state management, and Supabase backend integration. Create, read, and share blog posts with an elegant and responsive user interface.

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)](https://dart.dev)
[![Supabase](https://img.shields.io/badge/Supabase-Backend-3ECF8E?logo=supabase)](https://supabase.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## ✨ Features

### 🔐 Authentication System
- **User Registration** - Create new accounts with email and password
- **Secure Login** - JWT-based authentication with Supabase
- **Session Management** - Persistent login with automatic session handling
- **User Profile** - Display user information and manage account details

### 📰 Blog Management
- **Create Posts** - Write and publish blog posts with rich content
- **Image Upload** - Add cover images to your blog posts
- **Category Selection** - Organize posts with multiple categories (Technology, Business, Programming, Entertainment)
- **Reading Time Calculation** - Automatic estimation of reading duration
- **Blog Feed** - Browse all published blog posts
- **Detailed View** - Read full blog posts with formatted content
- **Offline Support** - Local caching with Hive for offline access

### 🎨 User Interface
- **Modern Design** - Clean and intuitive Material Design interface
- **Responsive Layout** - Adaptive UI using ScreenUtil for all screen sizes
- **Custom Fonts** - Beautiful typography with Google Fonts
- **Smooth Navigation** - Declarative routing with GoRouter
- **Loading States** - Elegant loading indicators and error handling

---

## 📸 Screenshots

### Authentication Screens
<table>
  <tr>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.07 (2).jpeg" width="250" alt="Splash Screen"/>
      <br/>
      <b>Splash Screen</b>
    </td>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.06 (3).jpeg" width="250" alt="Sign In"/>
      <br/>
      <b>Sign In</b>
    </td>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.06 (1).jpeg" width="250" alt="Sign Up"/>
      <br/>
      <b>Sign Up</b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.06 (2).jpeg" width="250" alt="Sign In - Validation"/>
      <br/>
      <b>Sign In - Validation</b>
    </td>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.06.jpeg" width="250" alt="Sign Up - Validation"/>
      <br/>
      <b>Sign Up - Validation</b>
    </td>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.05 (2).jpeg" width="250" alt="Signed In Successfully"/>
      <br/>
      <b>Signed In Successfully</b>
    </td>
  </tr>
</table>

### Blog Feed
<table>
  <tr>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.07.jpeg" width="250" alt="Blog Feed"/>
      <br/>
      <b>Blog Feed</b>
    </td>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.04.jpeg" width="250" alt="Blog Feed with Categories"/>
      <br/>
      <b>Blog Feed with Categories</b>
    </td>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.07 (1).jpeg" width="250" alt="Blog Feed - Multiple Posts"/>
      <br/>
      <b>Blog Feed - Multiple Posts</b>
    </td>
  </tr>
</table>

### Blog Details
<table>
  <tr>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.00.jpeg" width="250" alt="Blog Details"/>
      <br/>
      <b>Blog Details</b>
    </td>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.01.jpeg" width="250" alt="Blog Details - My New One"/>
      <br/>
      <b>Blog Details - My New One</b>
    </td>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.02.jpeg" width="250" alt="Blog Details - Hell of the Future"/>
      <br/>
      <b>Blog Details - Hell of the Future</b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.05 (3).jpeg" width="250" alt="Blog Details - Game"/>
      <br/>
      <b>Blog Details - Game</b>
    </td>
  </tr>
</table>

### Add Blog Screens
<table>
  <tr>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.05 (1).jpeg" width="250" alt="Add Blog - Empty Form"/>
      <br/>
      <b>Add Blog - Empty Form</b>
    </td>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.05.jpeg" width="250" alt="Add Blog - Validation"/>
      <br/>
      <b>Add Blog - Validation</b>
    </td>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.04 (1).jpeg" width="250" alt="Add Blog - With Image"/>
      <br/>
      <b>Add Blog - With Image</b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="assests/screenshots/WhatsApp Image 2026-02-17 at 01.26.04 (2).jpeg" width="250" alt="Add Blog - With Content"/>
      <br/>
      <b>Add Blog - With Content</b>
    </td>
  </tr>
</table>

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles with a clear separation of concerns:

```
lib/
├── core/                          # Core utilities and shared resources
│   ├── errors/                    # Error handling (Exceptions, Failures)
│   ├── functions/                 # Utility functions (date formatting, reading time)
│   ├── secrets/                   # API keys and configuration
│   ├── theme/                     # App theme and color palette
│   └── utils/                     # Routing, DI, and common utilities
│
├── features/                      # Feature modules
│   ├── auth/                      # Authentication feature
│   │   ├── data/
│   │   │   ├── data_sources/      # Remote data sources (Supabase)
│   │   │   ├── models/            # Data models
│   │   │   └── repos/             # Repository implementations
│   │   ├── domain/
│   │   │   ├── entities/          # Business entities
│   │   │   ├── repos/             # Repository interfaces
│   │   │   └── usecases/          # Business logic use cases
│   │   └── presentation/
│   │       ├── manager/           # BLoC state management
│   │       └── views/             # UI screens and widgets
│   │
│   └── blog/                      # Blog feature
│       ├── data/
│       │   ├── data_sources/      # Remote & Local data sources
│       │   ├── models/            # Data models with Hive adapters
│       │   └── repos/             # Repository implementations
│       ├── domain/
│       │   ├── entities/          # Business entities
│       │   ├── repos/             # Repository interfaces
│       │   └── usecases/          # Business logic use cases
│       └── presentation/
│           ├── manager/           # BLoC state management
│           └── views/             # UI screens and widgets
│
└── main.dart                      # Application entry point
```

### 🎯 Design Patterns

- **Clean Architecture** - Separation of concerns with layers (Presentation, Domain, Data)
- **Repository Pattern** - Abstract data sources behind repository interfaces
- **Use Case Pattern** - Encapsulate business logic in reusable use cases
- **BLoC Pattern** - Predictable state management with flutter_bloc
- **Dependency Injection** - Service locator pattern with GetIt
- **Either Pattern** - Functional error handling with fpdart

---

## 🛠️ Tech Stack

### Core Framework
- **Flutter** `^3.9.2` - Cross-platform UI framework
- **Dart** `^3.9.2` - Programming language

### State Management
- **flutter_bloc** `^9.1.1` - Business Logic Component pattern
- **fpdart** `^1.2.0` - Functional programming utilities (Either, Option)

### Backend & Database
- **supabase_flutter** `^2.12.0` - Backend as a Service (Authentication, Database, Storage)
- **hive** `^2.2.3` - Lightweight local database for offline caching
- **hive_flutter** `^1.1.0` - Hive integration for Flutter

### Dependency Injection
- **get_it** `^9.2.0` - Service locator for dependency injection

### Navigation
- **go_router** `^17.1.0` - Declarative routing solution

### UI & Styling
- **flutter_screenutil** `^5.9.3` - Responsive screen adaptation
- **google_fonts** `^6.2.1` - Custom font integration
- **dotted_border** `^3.1.0` - Custom border styling

### Media & Utilities
- **image_picker** `^1.2.1` - Image selection from gallery/camera
- **intl** `^0.20.2` - Internationalization and date formatting
- **uuid** `^4.5.2` - Unique identifier generation

### Development Tools
- **build_runner** `^2.4.13` - Code generation
- **hive_generator** `^2.0.1` - Hive model generation
- **flutter_lints** `^5.0.0` - Linting rules

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.9.2`
- Dart SDK `>=3.9.2`
- Android Studio / VS Code with Flutter extensions
- Supabase account (for backend services)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/mohamadnafe14-arch/Blog-App.git
   cd blog_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Supabase**
   
   Create a file `lib/core/secrets/app_secrets.dart`:
   ```dart
   class AppSecrets {
     static const String supaBaseUrl = 'YOUR_SUPABASE_URL';
     static const String supaKey = 'YOUR_SUPABASE_ANON_KEY';
   }
   ```

4. **Set up Supabase Database**
   
   Create the following tables in your Supabase project:

   **Users Table** (handled automatically by Supabase Auth)
   
   **Blogs Table:**
   ```sql
   CREATE TABLE blogs (
     id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
     poster_id UUID REFERENCES auth.users(id),
     title TEXT NOT NULL,
     content TEXT NOT NULL,
     image_url TEXT,
     topics TEXT[],
     updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
     created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
   );
   ```

5. **Generate Hive adapters**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

6. **Run the app**
   ```bash
   flutter run
   ```

---

## 📱 Platform Support

| Platform | Status |
|----------|--------|
| Android  | ✅ Supported |
| iOS      | ✅ Supported |
| Web      | ✅ Supported |
| Windows  | ✅ Supported |
| macOS    | ✅ Supported |
| Linux    | ✅ Supported |

---

## 🔑 Key Features Implementation

### Authentication Flow
- User registration with email validation
- Secure password handling
- JWT token management
- Automatic session persistence
- Current user state management

### Blog Operations
- **Create**: Upload images, select categories, write content
- **Read**: Fetch blogs from Supabase, display in feed
- **Offline**: Cache blogs locally with Hive
- **Sync**: Automatic synchronization when online

### State Management
- Centralized state with BLoC
- Reactive UI updates
- Error state handling
- Loading state management

---

## 📂 Project Structure Details

### Core Layer
- **Errors**: Custom exceptions and failure classes
- **Functions**: Reusable utility functions (date formatting, reading time calculation)
- **Theme**: Centralized theme configuration and color palette
- **Utils**: Routing configuration, dependency injection setup

### Feature Modules
Each feature follows the same structure:
- **Data Layer**: Data sources, models, repository implementations
- **Domain Layer**: Entities, repository interfaces, use cases
- **Presentation Layer**: BLoC cubits, UI screens, widgets

---

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Generate coverage report
genhtml coverage/lcov.info -o coverage/html
```

---

## 🔧 Build & Release

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Mohamed Nafe**

- GitHub: [@mohamadnafe14-arch](https://github.com/mohamadnafe14-arch)

---

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev) - UI framework
- [Supabase](https://supabase.com) - Backend infrastructure
- [BLoC Library](https://bloclibrary.dev) - State management
- [GetIt](https://pub.dev/packages/get_it) - Dependency injection
- [Hive](https://docs.hivedb.dev) - Local storage

---

## 📞 Support

If you have any questions or need help, feel free to:
- Open an issue on GitHub
- Contact via email

---

<div align="center">

**Made with ❤️ using Flutter**

⭐ Star this repository if you find it helpful!

</div>
