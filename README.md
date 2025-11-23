# Social Login + Settings + WebView App

A Flutter application for iOS and Android that demonstrates:

1. Social login (Google & Facebook) via Firebase Auth
2. A Settings tab to:
   - Enter and persist a website URL
   - Choose a network device (Wi‑Fi or Bluetooth)
3. A WebView tab that loads the stored URL

---

## ✨ Features

- **Cross‑platform:** iOS and Android
- **Social Login:**
  - Google Sign‑In (`google_sign_in` + `firebase_auth`)
  - Facebook Login (`flutter_facebook_auth` + `firebase_auth`)
- **Settings Tab:**
  - Input field to store a website URL (validated)
  - Dropdown to select a network device: Wi‑Fi or Bluetooth
  - Local persistence via `SharedPreferencesService`
- **WebView Tab:**
  - Loads the URL saved in Settings using `webview_flutter`
  - Shows an empty state if no URL is configured
- **Architecture & Reuse:**
  - Feature‑based folder structure
  - `flutter_bloc` Cubits for state management
  - Reusable UI (custom buttons, form fields, validators, theme)
- **Routing:** `go_router`

---

## 🧱 Tech Stack

- **Framework:** Flutter (Dart)
- **State Management:** `flutter_bloc`
- **Routing:** `go_router`
- **Authentication:** `firebase_auth`, `google_sign_in`, `flutter_facebook_auth`
- **WebView:** `webview_flutter`
- **Local Storage:** `shared_preferences` (wrapped by `SharedPreferencesService`)
- **Utilities & UI:** validators, responsive helpers, centralized theme/colors

See `pubspec.yaml` for versions.

---

## 📱 App Flow

The app starts at the Login screen and redirects to Home if already authenticated.

1. **Login Screen** (initial route `/login`)

   - Google and Facebook buttons
   - On success, navigates to Home
   - If already logged in, automatic redirect to Home

2. **Home** (bottom navigation with two tabs)

   - **WebView Tab**

     - Reads the stored URL (`SharedPrefsKeys.url`)
     - Loads it inside a WebView
     - If no URL is stored, shows an empty state with guidance

   - **Settings Tab**

     - Text field for Website URL (validated via `validators.dart`)
     - Dropdown for Network Device (Wi‑Fi, Bluetooth)
     - “Save” persists:
       - `SharedPrefsKeys.url`
       - `SharedPrefsKeys.selectedDevice`

Routes are defined with `go_router` in `lib/core/router`:

- `AppRoutes.login` → `/login`
- `AppRoutes.home` → `/home`
- `AppRoutes.settings` → `/settings`

---

## 🚀 Getting Started

### 1) Prerequisites

- Flutter SDK (check with `flutter --version`)
- Android Studio / Xcode
- A Firebase project (Android + iOS apps added)
- Facebook developer app (for Facebook Login)

### 2) Clone and install

```bash
git clone https://github.com/<your-username>/<your-repo-name>.git
cd <your-repo-name>
flutter pub get
```

### 3) Configure Firebase

This project uses FlutterFire (`firebase_core`) and `firebase_auth`.

- Generate platform configs (recommended):
  ```bash
  dart pub global activate flutterfire_cli
  flutterfire configure
  ```
- Or manually place the config files:
  - Android: `android/app/google-services.json`
  - iOS: `ios/Runner/GoogleService-Info.plist`

Ensure `lib/firebase_options.dart` is generated (FlutterFire CLI) or updated to your own Firebase project.

### 4) Enable Google Sign‑In

- Firebase Console → Authentication → Sign‑in methods → Enable Google
- Android:
  - Ensure SHA‑1/SH‑256 fingerprints are added in Firebase project settings (if required)
  - `com.google.gms:google-services` plugin is already wired via Flutter
- iOS:
  - Ensure the reverse client ID from `GoogleService-Info.plist` is present in URL Types (Xcode → Runner target → Info → URL Types)

### 5) Enable Facebook Login

- Firebase Console → Authentication → Sign‑in methods → Enable Facebook
- Facebook Developer settings:
  - Configure app ID and secret
  - Add bundle identifier (iOS) and package name + key hashes (Android)
- Android Manifest/iOS URL Schemes should be updated per `flutter_facebook_auth` docs.

### 6) Run

```bash
flutter run
```

---

## 📂 Notable Structure

```
lib/
  core/
    constants/            # Asset paths, etc.
    router/               # go_router setup (routes + config)
    services/cache/       # SharedPreferencesService + keys
    theme/                # Theme and colors
    utils/                # Validators, sizing helpers
  features/
    auth/                 # Login screen + Google/Facebook services
    home/                 # Bottom nav hosting WebView + Settings
    settings/             # Settings screen + cubit
```

---

## 🔐 Notes on Auth

- Auth is performed via `firebase_auth` with providers:
  - Google (`google_sign_in`)
  - Facebook (`flutter_facebook_auth`)

---

## ✅ Status

- Initial route is `/login` with a redirect to `/home` when `is_logged_in` is true (see `core/router/router.dart`).
- WebView requires valid HTTPS URLs to load without ATS exceptions on iOS.


