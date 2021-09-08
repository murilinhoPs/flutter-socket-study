import 'package:flutter/material.dart';
import 'package:socket_chat/src/components/username_input.dart';
import 'package:styled_widget/styled_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usernameFocus = FocusNode();
  final messageFocus = FocusNode();

  final usernameInput = TextEditingController();
  final messageInput = TextEditingController();

  void _unfocusNode() {
    if (usernameFocus.hasPrimaryFocus) {
      usernameFocus.unfocus();
    } else if (messageFocus.hasPrimaryFocus) {
      messageFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Color(0xFF9EAEDB),
        centerTitle: true,
        title: Text('Socket chat flutter')
            .bold()
            .textColor(Colors.grey[800])
            .fontSize(24.0)
            .padding(all: 16.0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          UsernameInput(
            usernameInput: usernameInput,
            usernameFocus: usernameFocus,
          ),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Text('user: message')
                  .padding(horizontal: 16.0, vertical: 10.0);
            },
          ).expanded(),
          _messageField(),
        ],
      ).backgroundColor(Colors.blueGrey[100]).width(double.infinity),
    ).gestures(onTap: _unfocusNode);
  }

  Widget _messageField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextField(
          onSubmitted: (value) {},
          onChanged: (value) {},
          focusNode: messageFocus,
          controller: messageInput,
          mouseCursor: MaterialStateMouseCursor.textable,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Sua mensagem',
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
          ),
        )
            .constrained(
              maxWidth: MediaQuery.of(context).size.width - 120.0,
            )
            .height(40)
            .padding(vertical: 12.0),
        ElevatedButton(
          onPressed: () {},
          child: Text('Enviar').fontSize(12.0).padding(horizontal: 10.0),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
          ),
        ).height(38),
      ],
    ).backgroundColor(
      Color(0x6E969FB9),
    );
  }
}
