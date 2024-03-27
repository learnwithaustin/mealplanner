---

# Cloning and Setting Up a Meal Planner Project

This guide walks you through the steps to clone a Flutter project from GitHub and set up your development environment properly, including configuring the Flutter SDK and Dart paths in your IDE.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Cloning the Flutter Project](#cloning-the-flutter-project)
- [IDE Setup](#ide-setup)
  - [Flutter and Dart Path Setup in Android Studio](#flutter-and-dart-path-setup-in-android-studio)
  - [Flutter and Dart Path Setup in Visual Studio Code](#flutter-and-dart-path-setup-in-visual-studio-code)
- [Verifying Your Setup](#verifying-your-setup)
- [Next Steps](#next-steps)
- [Troubleshooting](#troubleshooting)

## Prerequisites

- Git installed on your machine.
- Flutter SDK installed and configured. (Refer to the Flutter Setup Guide if you haven't done this yet.)
- Your preferred IDE installed (Android Studio or Visual Studio Code).

## Cloning the Flutter Project

1. Navigate to the GitHub repository URL in your web browser.
2. Click on the green **Code** button and copy the repository URL.
3. Open your terminal or command prompt.
4. Change the current working directory to the location where you want the cloned directory.
5. Type `git clone`, and then paste the URL you copied earlier:

   ```bash
   git clone https://github.com/austin1631/mealplanner.git
   ```

6. Press **Enter** to create your local clone.

   ```bash
   cd mealplanner
   ```

7. Run `flutter pub get` to fetch the project dependencies.

## IDE Setup

### Flutter and Dart Path Setup in Android Studio

1. Open Android Studio.
2. Go to **File > Settings** (on macOS, **Android Studio > Preferences**).
3. Navigate to **Languages & Frameworks > Flutter**.
4. In the **Flutter SDK path**, enter the path where you've installed Flutter SDK.
5. Apply the changes.
6. Navigate to **Languages & Frameworks > Dart**.
7. Verify that the **Dart SDK path** matches the path within your Flutter SDK (`<Flutter SDK Path>/bin/cache/dart-sdk`). This should be automatically detected if you've set the Flutter SDK path correctly.
8. Apply and close the settings.

### Flutter and Dart Path Setup in Visual Studio Code

1. Open Visual Studio Code.
2. Go to **File > Preferences > Settings** (or **Code > Preferences > Settings** on macOS).
3. Search for **Flutter** in the search bar and ensure the Flutter SDK path is correctly set under **Flutter: SDK Path**. If not, you can manually set the path.
4. To set the Dart SDK path, simply ensure the Flutter SDK is correctly set up. VS Code automatically uses the Dart SDK that comes bundled with the Flutter SDK.
5. Restart VS Code if necessary to apply the changes.

## Verifying Your Setup

After setting up your IDE, verify your project setup by running the Flutter project:

1. Open the terminal in your IDE.
2. Navigate to your project root directory if you haven't already.
3. Run the following command to check for any issues:

   ```bash
   flutter doctor
   ```

4. To run the project, either use the play button in your IDE or run:

   ```bash
   flutter run
   ```

## Next Steps

- Explore the project files and familiarize yourself with the project structure.
- Start making changes to the project and test them on a simulator or physical device.
- Refer to the Flutter documentation for detailed guides and API references.

## Troubleshooting

If you encounter any issues with the Flutter or Dart path setup:

- Double-check the paths to ensure they point to the correct directories.
- Ensure you have the latest versions of Flutter, Dart, and your IDE.
- Consult the Flutter and Dart documentation for more detailed setup instructions.
- Search for similar issues on [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter) or the [Flutter GitHub repository](https://github.com/flutter/flutter/issues).

---

This guide is a general approach to cloning and setting up a Flutter project from GitHub. Always refer to specific instructions provided within the project's README file or consult the project's maintainers for setup steps unique to the project.
