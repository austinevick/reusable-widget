import 'package:flutter/material.dart';

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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 120));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller!);
    controller!.forward();
    controller!.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 35,
              decoration: BoxDecoration(
                  color: const Color(0xff3f4768),
                  border: Border.all(color: const Color(0xff3f4768), width: 3),
                  borderRadius: BorderRadius.circular(50)),
              child: Stack(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) => Container(
                        width: constraints.maxWidth * animation!.value,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
