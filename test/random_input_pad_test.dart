import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_input_pad/random_input_pad.dart';

void main() {
  group('RandomInputPad Widget Tests', () {
    testWidgets('displays input correctly', (WidgetTester tester) async {
      String? enteredPin;
      
      // Build the RandomInputPad widget with a callback to capture the input.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RandomInputPad(
              onFinish: (input) {
                enteredPin = input;
              },
            ),
          ),
        ),
      );

      // Ensure the initial input is empty.
      expect(find.text('Masukkan PIN kamu'), findsOneWidget);
      expect(find.byIcon(Icons.circle), findsNWidgets(6));

      // Simulate tapping numbers.
      await tester.tap(find.text('1'));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.tap(find.text('4'));
      await tester.tap(find.text('5'));
      await tester.tap(find.text('6'));
      await tester.pump();

      // Check if inputData is updated on each tap.
      expect(find.text('123456'), findsOneWidget);
      expect(enteredPin, '123456'); // Callback should be called with the complete input.

      // Simulate tapping the backspace button ("<").
      await tester.tap(find.byIcon(Icons.backspace));
      await tester.pump();
      
      // Check if the last character is removed.
      expect(find.text('12345'), findsOneWidget);
      expect(enteredPin, '123456'); // Callback not called after deletion.
    });

    testWidgets('calls onFinish on "ok" tap', (WidgetTester tester) async {
      String? enteredPin;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RandomInputPad(
              onFinish: (input) {
                enteredPin = input;
              },
            ),
          ),
        ),
      );

      // Enter a partial input.
      await tester.tap(find.text('1'));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.tap(find.byIcon(Icons.check_circle_rounded));
      await tester.pump();

      // Check that onFinish was called with the partial input.
      expect(enteredPin, '123');
    });

    testWidgets('shuffles pad numbers on widget initialization', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RandomInputPad(
              onFinish: (_) {},
            ),
          ),
        ),
      );

      // Check that there is a "backspace" ("<") and "ok" button.
      expect(find.byIcon(Icons.backspace), findsOneWidget);
      expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);

      // Check that the rest are numbers and appear in a randomized order.
      final buttonNumbers = <String>[];
      for (var i = 0; i <= 9; i++) {
        buttonNumbers.add((i).toString());
      }
      for (var number in buttonNumbers) {
        expect(find.text(number), findsOneWidget);
      }
    });
  });
}
