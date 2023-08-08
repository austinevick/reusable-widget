import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String? image;
  final IconData? icon;
  final VoidCallback? onPressed;

  const CustomIconButton({Key? key, this.image, this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: const EdgeInsets.all(0),
        onPressed: onPressed,
        icon: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: icon != null
                ? Icon(
                    icon,
                    color: Colors.black,
                    size: 22,
                  )
                : Image.asset(image!, height: 18),
          ),
        ));
  }
}
