# Trash Disposal Locator

A Flutter app to help users locate nearby trash disposal sites, with map integration and location-based features.

---

## Screenshots

| Home Screen (Static) | App Demo (Animated) |
|---------------------|---------------------|
<div style="display: flex; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/1fc7605e-d4b9-4e37-b673-d49d4bc992bf" alt="Screenshot 1" width="400" height="600" />
  <span style="display:inline-block; width: 20px;"></span>
  <img src="https://github.com/user-attachments/assets/d8f63018-dfd8-4ea6-ab5d-8d312027a4a4" alt="Screenshot 2" width="400" height="600" />
</div>

## WEB screen shots
<div style="display: flex; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/50885e8b-3dbf-495c-a607-9cc77e607871" alt="Web Screenshot 1" width="400" height="600" style="padding-right: 20px;"/>
  <img src="https://github.com/user-attachments/assets/aa858f3c-0c97-4220-89eb-833323550e34" alt="Web Screenshot 2" width="400" height="600" />
</div>

---

## Architecture

This app follows a modular, feature-first architecture:

- **lib/**
  - **main.dart, main_dev.dart, main_staging.dart**: Entry points for production, development, and staging flavors.
  - **app.dart**: Root widget and app configuration.
  - **core/**: Shared resources (constants, enums, routes, styling, errors).
  - **features/**: Feature modules (e.g., onboarding, location, widgets).
    - **onboarding/**: Onboarding and splash screens.
    - **location/**: Map and location-related screens.
  - **app_config.dart**: Handles app flavor configuration.

- **assets/**: Images, icons, gifs, and lottie animations used in the app.

- **test/**: Unit and widget tests.

---

## Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart SDK (comes with Flutter)

### Install dependencies
```bash
flutter pub get
```

### Run the app
You can run the app in different flavors:

#### Production
```bash
flutter run --flavor production -t lib/main.dart
```

#### Development
```bash
flutter run --flavor development -t lib/main_dev.dart
```

#### Staging
```bash
flutter run --flavor staging -t lib/main_staging.dart
```

Or use your IDE's launch configurations (see `.vscode/launch.json`).

---

## Asset attributions

<a href="https://www.flaticon.com/free-animated-icons/gps-tracker" title="gps-tracker animated icons">Gps-tracker animated icons created by Freepik - Flaticon</a>

<a href="https://www.flaticon.com/free-icons/dustbin" title="dustbin icons">Dustbin icons created by Chattapat - Flaticon</a>

<a href="https://www.flaticon.com/free-stickers/rubbish" title="rubbish stickers">Rubbish stickers created by Stickers - Flaticon</a>






