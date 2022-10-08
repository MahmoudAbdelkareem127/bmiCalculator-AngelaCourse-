import 'package:flutter/material.dart';
import 'constants.dart';

class ButtonButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  const ButtonButton({super.key,  required this.onTap,required this.buttonText}) ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.pink.shade700,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(child: Text(buttonText,style:const TextStyle(fontSize: 30),)),
      ),
    );
  }
}
