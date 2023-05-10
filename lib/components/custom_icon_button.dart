import 'package:flutter/material.dart';

import '../common/utils.dart';

class CustomIconButton extends StatelessWidget {
  final String? image;
  final IconData? icon;
  final VoidCallback? onPressed;
  const CustomIconButton({super.key, this.image, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: const EdgeInsets.all(0),
        onPressed: onPressed,
        icon: CircleAvatar(
          radius: 22,
          backgroundColor: iconColor,
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
