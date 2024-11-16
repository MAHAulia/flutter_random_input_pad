import 'package:flutter/material.dart';
import 'package:random_input_pad/random_input_pad.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              String? pin = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InputPin()));
              if (pin != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(child: Text("PIN : $pin")),
                    backgroundColor: Colors.blue.shade500,
                    showCloseIcon: true,
                  ),
                );
              }
            },
            child: const Text("Input PIN"),
          ),
        ),
      ),
    );
  }
}





class InputPin extends StatelessWidget {
  const InputPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: SafeArea(
        child: RandomInputPad(
          onFinish: (input) {
            Navigator.pop(context, input);
          },
          totalInput: 6,
          backgroundColor: Colors.white,
          filledColor: Colors.indigo,
          actionButtonCollor: Colors.indigo,
          titleColor: Colors.black,
          title: "Masukkan PIN kamu",
          inputButtonRounded: 4.0,
          numberColor: Colors.black,
          buttonBorderColor: Colors.grey,
        ),
      ),
    );
  }
}
