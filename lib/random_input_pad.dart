library random_input_pad;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RandomInputPad extends StatefulWidget {
  const RandomInputPad({
    super.key,
    required this.onFinish,
    this.totalInput = 6,
    this.backgroundColor = Colors.white,
    this.actionButtonCollor = Colors.indigo,
    this.filledColor = Colors.indigo,
    this.inputButtonRounded = 4.0,
    this.title = "Masukkan PIN kamu",
    this.titleColor = Colors.black,
    this.numberColor = Colors.black,
    this.buttonBorderColor = Colors.grey,
  });
  final Function(String? input) onFinish;
  final int? totalInput;
  final Color? backgroundColor;
  final Color? actionButtonCollor;
  final Color? filledColor;
  final Color? titleColor;
  final Color? numberColor;
  final Color? buttonBorderColor;
  final double? inputButtonRounded;
  final String? title;

  @override
  State<RandomInputPad> createState() => _RandomInputPadState();
}

class _RandomInputPadState extends State<RandomInputPad> {
  var myPad = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  var currentPad = [];
  var totalInput = 6;
  var inputData = "";

  Color backgroundColor = Colors.white;
  Color actionButtonCollor = Colors.indigo;
  Color filledColor = Colors.indigo;
  Color titleColor = Colors.black;
  Color buttonBorderColor = Colors.grey;
  double inputButtonRounded = 4.0;
  String title = "Masukkan PIN kamu";
  Color numberColor = Colors.black;
  @override
  void initState() {
    handleParam();
    randomPad();
    super.initState();
  }

  handleParam() {
    setState(() {
      if (widget.totalInput != null) {
        totalInput = widget.totalInput!;
      }
      if (widget.buttonBorderColor != null) {
        buttonBorderColor = widget.buttonBorderColor!;
      }
      if (widget.numberColor != null) {
        numberColor = widget.numberColor!;
      }
      if (widget.titleColor != null) {
        titleColor = widget.titleColor!;
      }
      if (widget.backgroundColor != null) {
        backgroundColor = widget.backgroundColor!;
      }
      if (widget.actionButtonCollor != null) {
        actionButtonCollor = widget.actionButtonCollor!;
      }
      if (widget.filledColor != null) {
        filledColor = widget.filledColor!;
      }
      if (widget.inputButtonRounded != null) {
        inputButtonRounded = widget.inputButtonRounded!;
      }
      if (widget.title != null) {
        title = widget.title!;
      }
    });
  }

  randomPad() {
    var shuffledPad = List.of(myPad)..shuffle(Random());
    shuffledPad.add("<");
    shuffledPad.add("ok");
    setState(() {
      currentPad = shuffledPad;
    });
  }

  onTap(number) {
    if (number == "<") {
      if (inputData != "" && inputData.isNotEmpty) {
        setState(() {
          inputData = inputData.substring(0, inputData.length - 1);
        });
      }
    } else if (number == "ok") {
      widget.onFinish(inputData);
    } else {
      if (inputData.length < totalInput) {
        setState(() {
          inputData += number;
        });
        if (inputData.length == totalInput) {
          widget.onFinish(inputData);
          return;
        }
      } else {
        widget.onFinish(inputData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          DisplayInput(
            title: title,
            titleColor: titleColor,
            totalInput: totalInput,
            inputData: inputData,
            filledColor: filledColor,
          ),
          Expanded(
            child: Column(
              children: List.generate(
                4,
                (i) => PinPadButton(
                  numberColor: numberColor,
                  currentPosition: i,
                  currentPad: currentPad,
                  actionButtonCollor: actionButtonCollor,
                  inputButtonRounded: inputButtonRounded,
                  buttonBorderColor: buttonBorderColor,
                  onTap: onTap,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DisplayInput extends StatelessWidget {
  const DisplayInput({
    super.key,
    required this.totalInput,
    required this.inputData,
    required this.filledColor,
    required this.title,
    required this.titleColor,
  });

  final Color filledColor, titleColor;
  final String inputData, title;
  final int totalInput;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500, color: titleColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalInput,
              (i) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Icon(
                  Icons.circle,
                  size: 16,
                  color: inputData.length >= i + 1 ? filledColor : titleColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PinPadButton extends StatelessWidget {
  const PinPadButton({
    super.key,
    required this.currentPad,
    required this.currentPosition,
    required this.actionButtonCollor,
    required this.inputButtonRounded,
    required this.onTap,
    required this.numberColor,
    required this.buttonBorderColor,
  });

  final int currentPosition;
  final List currentPad;
  final Color actionButtonCollor, numberColor, buttonBorderColor;
  final double inputButtonRounded;
  final Function(String? number) onTap;

  @override
  Widget build(BuildContext context) {
    var add = 0;
    if (currentPosition == 0) {
      add = 0;
    } else if (currentPosition == 1) {
      add = 3;
    } else if (currentPosition == 2) {
      add = 6;
    } else if (currentPosition == 3) {
      add = 9;
    }
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          3,
          (i) {
            var number = currentPad[i + add];
            late StatelessWidget display;
            if (number == "<") {
              display = Icon(
                Icons.backspace,
                color: actionButtonCollor,
              );
            } else if (number == "ok") {
              display = Icon(
                Icons.check_circle_rounded,
                color: actionButtonCollor,
              );
            } else {
              display = Text(number, style: TextStyle(color: numberColor, fontWeight: FontWeight.w400),);
            }
            return Expanded(
              child: Container(
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  border: Border.all(color: buttonBorderColor),
                  borderRadius: BorderRadius.circular(inputButtonRounded),
                ),
                height: double.infinity,
                child: InkWell(
                  splashColor: actionButtonCollor,
                  onTap: () => onTap(number),
                  child: Center(
                    child: display,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
