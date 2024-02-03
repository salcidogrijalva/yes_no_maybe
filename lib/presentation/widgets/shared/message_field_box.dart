import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        hintText: 'End your message with a "?"',
        suffixIcon: IconButton(
          icon:const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            print('Button: $textValue');
          },
        )
      );

    return TextFormField(
      controller: textController,
      decoration: inputDecoration,
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        print('Submitted value: $value');
        textController.clear();
        focusNode.requestFocus();
      },
      onTapOutside: (event) {
        focusNode.unfocus();
      },
    );
  }
}
