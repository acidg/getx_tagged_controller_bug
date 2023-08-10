# controller_injection_bug

Minimal example to reproduce the controller injection bug

## Getting Started

1. Install Android Studio, Flutter, Dart-SDK and add the flutter plugin to Android Studio.
2. Run `flutter pub get` inside this repository to install dependencies.
3. Open the project with Android Studio.

## Bug description
### Expected
When switching between pages using the navigation bar at the bottom, the pages switch and the other counter named "Page2Counter" is displayed.

### Actual
A red error page appears displaying an assertion error, which shows that the controller for page 2 is not loaded correctly.