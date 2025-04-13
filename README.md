# Calculator App

A beautiful and functional calculator application built with Flutter, featuring a clean UI and smooth operations.

![Screenshot_20250413-185842](https://github.com/user-attachments/assets/5c05076a-d509-4f1b-9fcf-a61b975ca0b4)

## Features

- Basic arithmetic operations (addition, subtraction, multiplication, division)
- Real-time expression display
- Error handling for division by zero
- Clean and modern UI design
- Custom app icon and splash screen
- Responsive layout

## Screenshots

The calculator app features a modern interface with:
- Large, easy-to-read display
- Color-coded operation buttons
- Real-time expression preview
- Elegant result display

## State Management

The app uses Flutter's built-in `setState` for state management, which is suitable for this simple application. Here's how the state is managed:

### State Variables

```dart
String _input = '';          // Current input number
String _result = '';         // Calculation result
String _operation = '';      // Current operation (+, -, ×, ÷)
String _firstNumberDisplay = ''; // First number in the operation
String _expression = '';     // Complete mathematical expression
double _firstNumber = 0;     // First number stored as double
bool _isNewNumber = true;    // Flag for new number input
```

### State Updates

1. **Number Input (`_onNumberPressed`)**
   - Updates the current input
   - Builds the complete expression
   - Handles both first and second numbers

2. **Operation Selection (`_onOperationPressed`)**
   - Stores the first number
   - Sets the operation
   - Updates the expression display

3. **Calculation (`_onEqualPressed`)**
   - Performs the arithmetic operation
   - Handles division by zero
   - Updates the result display
   - Resets the state for new calculations

4. **Clear Function (`_onClearPressed`)**
   - Resets all state variables
   - Prepares for new input

## Code Structure

The app is organized into several key components:

```
lib/
├── main.dart              # App entry point and theme configuration
├── screens/
│   └── calculator_screen.dart  # Main calculator UI and logic
└── assets/
    └── calculator_8982368.png  # App icon and splash screen image
```

## Installation

1. Ensure you have Flutter installed on your machine
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_launcher_icons: ^0.13.1
  flutter_native_splash: ^2.3.13
```

## State Management Flow

```
User Input → State Update → UI Rebuild
   ↑                           |
   └───────────────────────────┘
```

1. **User Interaction**
   - Button press triggers state update method

2. **State Update**
   - `setState` is called
   - State variables are updated
   - Expression is built

3. **UI Update**
   - Flutter rebuilds the widget tree
   - Display shows updated values
   - Buttons reflect current state

## Error Handling

The app includes error handling for:
- Division by zero
- Invalid operations
- Number format exceptions

## Future Improvements

Potential enhancements could include:
- Scientific calculator functions
- History of calculations
- Theme customization
- Landscape mode support
- Advanced error handling
