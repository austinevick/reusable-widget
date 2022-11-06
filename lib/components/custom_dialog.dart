import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Dialog(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        child: SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 35,
                  child: Icon(Icons.done, size: 50),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Success',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Lorem ipsum molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam.',
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                CustomButton(
                  height: 40,
                  color: Colors.blue,
                  text: 'Continue',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      );
}
