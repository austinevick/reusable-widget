import 'package:flutter/material.dart';

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80, right: 80),
      child: Dialog(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none),
        child: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                      valueColor: AlwaysStoppedAnimation(Colors.grey),
                    )),
              ),
              SizedBox(height: 15),
              Text(
                'Processing',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
