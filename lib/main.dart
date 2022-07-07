import 'package:flutter/material.dart';
import 'package:reusable_widget/components/custom_textfield.dart';

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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Material(
            elevation: 4,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: SizedBox(
                        height: 120,
                        width: 120,
                        child: CustomTextfield(
                          textStyle: TextStyle(fontSize: 18),
                          onChanged: (value) {
                            if (value.length == 1) {}
                          },
                        ))),
                Expanded(
                    child: SizedBox(
                        height: 120, width: 120, child: CustomTextfield())),
                Expanded(
                    child: SizedBox(
                        height: 120, width: 120, child: CustomTextfield())),
                Expanded(
                    child: SizedBox(
                        height: 120, width: 120, child: CustomTextfield())),
              ],
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
