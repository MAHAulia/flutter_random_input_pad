# RandomInputPad - Flutter Package

`RandomInputPad` is a customizable, randomly shuffled numeric keypad widget designed for secure PIN input. This Flutter widget is ideal for any password or security-related screen where an unpredictable input layout adds an extra layer of security.

## Features

- **Randomized Keypad Layout**: Keys are shuffled each time the widget is initialized, preventing predictable PIN entry.
- **Customizable Design**: Configure colors, shapes, button borders, text labels, and other UI elements.
- **Callback for Completion**: `onFinish` callback function triggers with the user's input when the PIN entry is complete or "OK" is pressed.
- **Supports Custom Input Lengths**: Set the required number of input digits.

## Installation

To use `RandomInputPad` in your Flutter project, add it to your dependencies in `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  random_input_pad:
```

Then, import it in your Dart file:

```dart
import 'package:random_input_pad/random_input_pad.dart';
```

## Basic Usage

Add the `RandomInputPad` widget to your widget tree, customizing the parameters as needed:

```dart
import 'package:flutter/material.dart';
import 'package:random_input_pad/random_input_pad.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Random Input Pad Example")),
        body: Center(
          child: RandomInputPad(
            onFinish: (input) {
              // Handle the completed PIN input
              print("Entered PIN: $input");
            },
            totalInput: 4, // Set number of digits required
            backgroundColor: Colors.white,
            actionButtonCollor: Colors.indigo,
            filledColor: Colors.green,
            title: "Enter Your PIN",
            titleColor: Colors.black,
            numberColor: Colors.black,
            buttonBorderColor: Colors.grey,
            inputButtonRounded: 8.0,
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
```

## Parameters

| Parameter             | Type            | Default        | Description                                                                                     |
|-----------------------|-----------------|----------------|-------------------------------------------------------------------------------------------------|
| `onFinish`            | `Function`      | **Required**   | Callback function that receives the entered PIN when "OK" is tapped or input length is reached. |
| `totalInput`          | `int`           | `6`            | The required length of the input PIN.                                                           |
| `backgroundColor`     | `Color`         | `Colors.white` | Background color of the input pad container.                                                    |
| `actionButtonCollor`  | `Color`         | `Colors.indigo`| Color of the action buttons (OK and backspace).                                                 |
| `filledColor`         | `Color`         | `Colors.indigo`| Color of the filled dots for entered digits.                                                    |
| `title`               | `String`        | `"Masukkan PIN kamu"` | Title text shown above the input pad.                                                   |
| `titleColor`          | `Color`         | `Colors.black` | Color of the title text.                                                                        |
| `numberColor`         | `Color`         | `Colors.black` | Color of the number text on the keypad buttons.                                                 |
| `buttonBorderColor`   | `Color`         | `Colors.grey`  | Color of the border around each button.                                                         |
| `inputButtonRounded`  | `double`        | `4.0`          | Border radius for the keypad buttons.                                                           |

## Example

To create a `RandomInputPad` with default settings:

```dart
RandomInputPad(
  onFinish: (input) {
    print("Entered PIN: $input");
  },
)
```

To create a customized `RandomInputPad`:

```dart
RandomInputPad(
  onFinish: (input) {
    print("PIN is complete: $input");
  },
  totalInput: 4,
  backgroundColor: Colors.blue.shade50,
  actionButtonCollor: Colors.redAccent,
  filledColor: Colors.green,
  title: "Secure PIN Entry",
  titleColor: Colors.blueGrey,
  numberColor: Colors.black,
  buttonBorderColor: Colors.blueGrey,
  inputButtonRounded: 10.0,
)
```

Here's the English translation:

---

### Support
If you’d like to support the development of this package, you can  
☕️ [Buy Me a Coffee](https://www.buymeacoffee.com/abdulhaqaulia) 
or support by scanning the QR code via  
☕️ [Saweria](https://saweria.co/overlays/qr?streamKey=54dc04b8045bb0355cde915ab1bb85b5&topLabel=MAHA&bottomLabel=Buy+Me+A+Coffe&backgroundColor=%232b9dfaFF&barcodeColor=%23000&username=maha).

<!-- QR Code image for Saweria -->
<img src="https://saweria.co/overlays/qr?streamKey=54dc04b8045bb0355cde915ab1bb85b5&topLabel=MAHA&bottomLabel=Buy+Me+A+Coffe&backgroundColor=%232b9dfaFF&barcodeColor=%23000&username=maha" alt="Support via Saweria" width="150" height="150"/>

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.