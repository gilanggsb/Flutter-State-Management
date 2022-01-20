import 'package:flutter/material.dart';

class CustomInputDialog extends StatelessWidget {
  const CustomInputDialog({
    Key? key,
    required TextEditingController input1Controller,
    required TextEditingController input2Controller,
    required this.textInput1,
    required this.textInput2,
  })  : _input1Controller = input1Controller,
        _input2Controller = input2Controller,
        super(key: key);

  final TextEditingController _input1Controller;
  final TextEditingController _input2Controller;
  final String textInput1;
  final String textInput2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: _input1Controller,
          decoration: InputDecoration(
            hintText: textInput1,
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: _input2Controller,
          decoration: InputDecoration(
            hintText: textInput2,
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
          ),
        ),
      ],
    );
  }
}
