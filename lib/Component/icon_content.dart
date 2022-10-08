import 'package:flutter/material.dart';
import 'constants.dart';
class IconContent extends StatelessWidget {
  final IconData icon;
  final String name;
  const IconContent({super.key, required this.icon,required this.name});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget> [
        Icon(icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(name,style:kTextStyle)
      ],

    );
  }
}