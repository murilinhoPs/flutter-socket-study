import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class UsernameInput extends StatefulWidget {
  final TextEditingController usernameInput;
  final double width, paddingVertical;
  final FocusNode usernameFocus;
  final bool isActive;

  const UsernameInput({
    Key key,
    @required this.usernameInput,
    @required this.usernameFocus,
    this.paddingVertical = 16.0,
    this.width = 120,
    this.isActive = false,
  }) : super(key: key);

  @override
  _UsernameInputState createState() => _UsernameInputState();
}

class _UsernameInputState extends State<UsernameInput> {
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    widget.usernameFocus.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          onChanged: (value) {},
          focusNode: widget.usernameFocus,
          controller: widget.usernameInput,
          enabled: isActive,
          onEditingComplete: () => setState(() => isActive = false),
          mouseCursor: MaterialStateMouseCursor.textable,
          decoration: InputDecoration(
            hintText: 'Seu username',
            border: OutlineInputBorder(),
          ),
        )
            .constrained(
              maxWidth: MediaQuery.of(context).size.width - widget.width,
            )
            .borderRadius(all: 30.0),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            setState(() => isActive = true);
            widget.usernameFocus.requestFocus();
          },
        ),
      ],
    ).padding(vertical: widget.paddingVertical);
  }
}
