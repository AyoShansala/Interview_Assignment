import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
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
      height: height * 0.04,
      width: width * 0.3,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 8,
        ),
        child: Text(
          btnName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: txtColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
