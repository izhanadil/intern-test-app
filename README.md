
# Flutter Medication Management App

This is a simple Flutter app designed to demonstrate core concepts of Flutter UI design, OOP (Object-Oriented Programming) principles, and best practices in mobile app development. The app consists of a login screen and a home screen that manages a list of medications using a well-organized OOP structure. The app allows users to add, edit, and delete medications while ensuring proper validation and feedback mechanisms.

## Features

### 1. **Login Screen**
   - A simple login screen that includes email and password fields.
   - The login screen uses validation to ensure that the user enters a valid email and a password with at least 8 characters.
   - The login screen accepts a predefined email (`izhan@gmail.com`) and password (`IzhanIzhan`).
   - If the login credentials are incorrect, the user is notified through an alert dialog.
   - On successful login, the user is navigated to the Home screen.

### 2. **Home Screen**
   - Displays a list of medications.
   - Users can add a new medication or a prescription medication.
   - Users can edit or delete an existing medication from the list.
   - The app uses custom-styled UI elements and color themes to ensure a visually appealing and responsive interface.

### 3. **OOP Design**
   - The app leverages object-oriented principles by implementing a `Medication` class and its subclass `PrescriptionMedication`.
   - A `MedicationManager` class manages all medication-related operations such as adding, editing, and removing medications.
   - Encapsulation, inheritance, and polymorphism are used to extend and customize medication features.

### 4. **Input Validation**
   - The app ensures that users provide valid email and password information in the login screen.
   - The app also checks that the medication name and dose fields are not empty when adding or editing medications.
   - A `SnackBar` is used to display errors when the input is invalid.

## Project Structure

The project is organized into several files and folders for better maintainability and readability:

```
lib/
├── Colors.dart                // Custom colors for app theming
├── Models/
│   ├── Medication.dart        // Defines the Medication class
│   ├── PrescriptionMedication.dart // Defines the PrescriptionMedication class (subclass of Medication)
│   └── MedicationManager.dart // Manages medication-related operations
├── Screens/
│   ├── LoginScreen.dart       // The login screen with form validation
│   ├── HomeScreen.dart        // The home screen that displays the list of medications
│   └── EditMedicationScreen.dart // Allows users to edit existing medication
└── main.dart                  // Main entry point of the app
```

## Design Choices

### UI/UX
- **Responsive and Clean Design**: The app uses Flutter widgets such as `TextField`, `ListView`, `Card`, and `ListTile` to create a clean and user-friendly interface.
- **Feedback and Validation**: Users are always informed about what’s happening, thanks to proper form validation and error feedback through dialogs and `SnackBar`s.
- **Consistent Theme**: The app follows a consistent color scheme using custom color classes defined in `Colors.dart`.

### Object-Oriented Programming
- **Encapsulation and Inheritance**: The `PrescriptionMedication` class extends the `Medication` class to include additional properties such as `prescribedBy`. This demonstrates the use of inheritance to extend functionality.
- **Polymorphism**: The `MedicationManager` class manages both `Medication` and `PrescriptionMedication` objects in a single list using polymorphism.
- **Proper Separation of Concerns**: Each class is separated into its own file, ensuring that the project is organized and easy to maintain.

## Getting Started

### Prerequisites
- Flutter SDK installed on your local machine.
- Android Studio or any other IDE that supports Flutter.

### Steps to Run the App

1. **Clone the repository**:
   ```bash
   git clone <repository-link>
   cd <repository-folder>
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

4. **Build APK**:
   If you want to build an APK for Android:
   ```bash
   flutter build apk --release
   ```

## Assumptions
- The login system is simulated with predefined credentials (`izhan@gmail.com` and `IzhanIzhan`) and does not include any backend or persistence mechanisms as long-term data storage was not part of the assessment.
- No database or persistent storage has been implemented, as this was not a requirement.

## Additional Features
- A basic validation system is implemented in both the login screen and medication forms.
- Error handling through dialogs and snack bars to guide users when they make mistakes.

## Evaluation Criteria
The project adheres to the following evaluation criteria:
- **UI/UX design**: Clean and responsive UI with validation and feedback mechanisms.
- **OOP Concepts**: Proper use of encapsulation, inheritance, and polymorphism.
- **Code organization and readability**: Code is well-structured and follows Dart and Flutter best practices.
- **Creativity**: A thoughtful and user-friendly medication management system.

## License
This project is licensed under the MIT License.

