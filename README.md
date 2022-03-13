# Bike_Catalog

Mobile solution for a bike catalog with bike detail view.

### Setup Instructions

Please follow below steps:

- Download and install Flutter sdk
- More info and help : https://docs.flutter.dev/get-started/install
- Download and install IDE (vs code is recommended)
- Open the project
- Run following commands:
  - flutter pub get ( to download required packages)
  - flutter packages pub run build_runner build --delete-conflicting-outputs ( to generate files and codes required for project)
- Select a target device such as android-iphone emulator or real device
  - use following links for help if needed:
    - https://docs.flutter.dev/get-started/test-drive
    - https://developer.android.com/studio/run/managing-avds
- flutter run (to run the project)
  - for more info on flutter cli : https://docs.flutter.dev/reference/flutter-cli

### Release info

- android :
  - flutter build apk --release
- ios :
  - flutter build ipa --release
- more info on :
  - https://docs.flutter.dev/deployment/ios
  - https://docs.flutter.dev/deployment/android

### Architecture

Following principles are followed:

- MVVM pattern for screens
- Injection pattern for dependencies and instantiation
- SOLID principles
- Latest Flutter coding style, conventions and lints
