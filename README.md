# Bike_Catalog

Mobile solution for a bike catalog with bike detail view.

### Setup Instructions

Please follow below steps:

- Download and install Flutter sdk More info [here](https://docs.flutter.dev/get-started/install)
- Download and install IDE (vscode is recommended)
- Open the project
- Run following commands:
  - flutter pub get ( to download required packages)
  - flutter packages pub run build_runner build --delete-conflicting-outputs ( to generate files and codes required for project)
- Select a target device such as android-iphone emulator or real device.follow [here](https://docs.flutter.dev/get-started/test-drive) and [here](https://developer.android.com/studio/run/managing-avds) if help is needed:
- flutter run (to run the project)
  - for more info on flutter cli [here](https://docs.flutter.dev/reference/flutter-cli)

\*\*Please make sure that your phone/emulator is connected to the internet so taht you are be able to see(download) the pictures

### Release info

- android :
  - flutter build apk --release
- ios :
  - flutter build ipa --release
- more info [ios](https://docs.flutter.dev/deployment/ios) and [android](https://docs.flutter.dev/deployment/android)

### Architecture

Following principles are followed:

- MVVM pattern for screens
- Injection pattern for dependencies and instantiation
- SOLID principles
- Latest Flutter coding style, conventions and lints. Enforced rules can be found [here](analysis_options.yaml)

more detailed information can be found [here](https://miro.com/app/board/uXjVOUqXTnc=/?invite_link_id=218787102528)
