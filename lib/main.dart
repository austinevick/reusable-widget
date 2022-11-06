import 'package:flutter/material.dart';
import 'package:reusable_widget/components/custom_textfield.dart';

import 'components/custom_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: TextButton(
      onPressed: () {
        showDialog(context: context, builder: (ctx) => const CustomDialog());
      },
      child: const Text('Show dialog'),
    )));
  }
}
