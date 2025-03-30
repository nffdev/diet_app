import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomBadge({
    Key? key,
    required this.label,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label, 
        style: TextStyle(
          fontSize: 12, 
          fontWeight: FontWeight.bold,
          color: textColor,
        )
      ),
    );
  }
}
