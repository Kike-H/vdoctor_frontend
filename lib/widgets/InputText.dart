import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType typeKeyboard;
  TextEditingController controller = TextEditingController();

  InputText({required this.label, this.obscureText = false, this.typeKeyboard = TextInputType.text, Key? key}) : super(key: key);

  String getValue() {
    return controller.text.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          keyboardType: typeKeyboard,
          decoration: InputDecoration(
              labelText: label,
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
          controller: controller,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
