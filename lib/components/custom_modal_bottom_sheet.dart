import 'package:flutter/material.dart';

class CustomModalBottomSheet extends StatelessWidget {
  final VoidCallback? button1OnTap;
  final VoidCallback? button2OnTap;
  final String title;
  final String? button1Text;
  final String? button2Text;
  const CustomModalBottomSheet(
      {Key? key,
      this.button1OnTap,
      this.button2OnTap,
      this.title = '',
      this.button1Text,
      this.button2Text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Text(
                    title,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  const Divider(
                    thickness: 1.8,
                    color: Colors.grey,
                  ),
                  const Spacer(),
                  customButton(onPressed: button1OnTap, text: button1Text),
                  customButton(
                      isEnabled: true,
                      onPressed: button2OnTap,
                      text: button2Text),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(),
            height: 70,
            shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15)),
            color: Colors.white,
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
            ),
            minWidth: double.infinity,
          )
        ],
      ),
    );
  }

  Widget customButton(
          {VoidCallback? onPressed, String? text, bool isEnabled = false}) =>
      Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(width: 1.8, color: Colors.grey))),
        child: MaterialButton(
            minWidth: double.infinity,
            color: Colors.white,
            height: 65,
            shape: !isEnabled
                ? OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(0))
                : const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
            onPressed: onPressed,
            child: Text(
              '$text',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
            )),
      );
}
