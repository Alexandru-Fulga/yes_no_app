// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({
    Key? key,
    required this.onValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );
    final textEditingController = TextEditingController();
    final focusNode = FocusNode();

    return TextFormField(
      decoration: InputDecoration(
        hintText: "End your message with a '?'",
        filled: true,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: IconButton(
          onPressed: () {
            onValue(textEditingController.text);
            textEditingController.clear();
          },
          icon: const Icon(Icons.send_outlined),
        ),
      ),
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textEditingController,
      onFieldSubmitted: (value) {
        onValue(value);
        textEditingController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
