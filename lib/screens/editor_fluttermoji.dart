import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:testing_app/screens/webview.dart';

class EmojiEditor extends StatefulWidget {
  const EmojiEditor({super.key});

  @override
  State<EmojiEditor> createState() => _EmojiEditorState();
}

class _EmojiEditorState extends State<EmojiEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: FluttermojiCircleAvatar(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
          leading: const IconButton(icon: Icon(Icons.web), onPressed: null),
          title: const Text('Lista Star Wars'),
        ),
        body: FluttermojiCustomizer(
          scaffoldHeight: MediaQuery.of(context).size.height * 0.83,
        ));
  }
}
