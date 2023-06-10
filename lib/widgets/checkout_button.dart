import 'package:flutter/material.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    super.key,
    required this.btnName,
    required this.btnColor,
    required this.txtColor,
  });
  final String btnName;
  final Color btnColor;
  final Color txtColor;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.06,
      width: width * 0.5,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          btnName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: txtColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
