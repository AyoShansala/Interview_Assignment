import 'package:flutter/material.dart';

class CustomIconDesign extends StatelessWidget {
  CustomIconDesign({
    super.key,
    required this.itemName,
    required this.itemIcon,
  });
  final String itemName;

  final IconData? itemIcon;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            child: Icon(itemIcon),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(itemName)
        ],
      ),
    );
  }
}
