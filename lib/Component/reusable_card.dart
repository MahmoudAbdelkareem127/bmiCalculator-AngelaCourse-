import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardWidget;
  final VoidCallback onPress;
  const ReusableCard({super.key, required this.color,required this.cardWidget,required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: color),
        child: cardWidget,



      ),
    );
  }
}