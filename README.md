
# Foody - Food Delivery App
  
A Flutter-based food delivery application with Firebase backend integration, featuring bilingual support (Arabic/English), dark mode, and a complete order management system.


##  Features

- **User Authentication**: Sign up and sign in with Firebase Authentication
- **Restaurant Browsing**: Browse restaurants with bilingual support (Arabic/English)
- **Menu Management**: View restaurant menus with item details
- **Shopping Cart**: Add items to cart with local persistence
- **Order Management**: Place orders, track order status, and view order history
- **Order Tracking**: Real-time order progress with stepper visualization
- **Reviews & Ratings**: Leave reviews and ratings for completed orders
- **Dark Mode**: Support for Light, Dark, and System theme modes
- **Localization**: Full bilingual support (Arabic/English) with RTL support
- **Pull-to-Refresh**: Refresh data on home and orders screens

## 🛠️ Tech Stack

- **Framework**: Flutter 3.38.2 (Dart 3.10.0)
- **State Management**: Provider
- **Local Storage**: Hive
- **Backend**: Firebase (Authentication, Realtime Database)
- **Code Generation**: Freezed, JSON Serializable
- **Dependency Injection**: GetIt
- **Localization**: flutter_intl

## 📋 Prerequisites

- Flutter SDK 3.38.2 or compatible
- Dart SDK 3.10.0
- Firebase project configured (see `FIREBASE_SETUP_GUIDE.md`)
- Android Studio / VS Code with Flutter extensions
- Android SDK / Xcode (for iOS)

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone <repository-url>
cd foody
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Firebase Setup

1. Follow the instructions in `FIREBASE_SETUP_GUIDE.md`
2. Ensure `google-services.json` is placed in `android/app/`
3. Configure Firebase Realtime Database rules (see `firebase_database_rules.json`)

### 4. Generate code

Run code generation for Freezed models, JSON serialization, and localization:

```bash
# Generate all code
flutter pub run build_runner build --delete-conflicting-outputs

# Generate localization files
flutter pub global run intl_utils:generate
```

Or use the shortcut scripts:

```bash
# Generate code
rps gen

# Generate localization
rps local
```

### 5. Run the app

```bash
# Run on connected device/emulator
flutter run

# Run in release mode
flutter run --release
```

## 📁 Project Structure

```
lib/
├── core/              # Core functionality
│   ├── config/        # App configuration (theme, language)
│   ├── data/          # Data layer (local storage, remote) -> Generic Code
│   ├── di/            # Dependency injection
│   ├── routing/       # Navigation and routing
│   └── theme/         # Theme system (colors, typography)
├── data/              # Data models and repositories
│   ├── model/         # Freezed data models
│   └── repo/          # Repository implementations
├── presentation/      # UI layer
│   ├── cart/          # Shopping cart
│   ├── checkout/      # Checkout flow
│   ├── home/          # Home screen
│   ├── menu/          # Menu screen
│   ├── orders/        # Orders management
│   ├── profile/       # User profile
│   └── sign_in/       # Authentication screens
├── shared/            # Shared utilities and widgets
└── l10n/              # Localization files (ARB)
```

## 🎨 Theme System

The app supports three theme modes:
- **Light**: Light color scheme
- **Dark**: Dark color scheme
- **System**: Follows device system preference

Theme preference is stored locally and persists across app restarts. Access theme settings from the Profile screen.

## 🌍 Localization

The app supports two languages:
- **English** (en)
- **Arabic** (ar) with RTL support

Localization files are located in `lib/l10n/`:
- `intl_en.arb` - English translations
- `intl_ar.arb` - Arabic translations

To add new translations:
1. Add keys to both ARB files
2. Run `rps local` or `flutter pub global run intl_utils:generate`
3. Use `S.current.keyName` in your code

## 📦 Key Dependencies

- `firebase_core`, `firebase_auth`, `firebase_database` - Firebase services
- `provider` - State management
- `hive_ce` - Local storage
- `freezed` - Immutable data classes
- `get_it` - Dependency injection
- `flutter_rating_bar` - Rating widgets
- `cached_network_image` - Image caching


## 📝 Notes

- The app uses Firebase Realtime Database for data storage
- Sample restaurant data can be added via the Profile screen
- Cart data is persisted locally using Hive
- User authentication state is managed by Firebase Auth
- Theme and language preferences are stored locally

## 🐛 Troubleshooting

### Code generation issues
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Localization not updating
```bash
flutter pub global run intl_utils:generate
flutter clean
flutter run
```

### Firebase connection issues
- Verify `google-services.json` is in `android/app/`
- Check Firebase project configuration
- Ensure Realtime Database rules are properly configured



---

**Built with Flutter** 



