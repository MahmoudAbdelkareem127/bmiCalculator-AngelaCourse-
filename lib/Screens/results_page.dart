import 'package:bmi_calculator/Component/constants.dart';
import 'package:bmi_calculator/Component/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Component/button_button.dart';


class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.bmiResults,required this.interpretation,required this.resultText});
  final String bmiResults;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF0A0E21),
          title: const Text("BMI CALCULATE")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Expanded(child: Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: const Text("Your Results",style: kTitleStyleHeavy),
          )),
          Expanded(flex:5,child: ReusableCard(color: kActiveCardColor, cardWidget:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
              Text(resultText.toUpperCase(),style: kResultsTextStyle,),
              Text(bmiResults,style: kBmiTextStyle,),
              Text(interpretation,
                style: kBodyTextStyle,textAlign: TextAlign.center,),
              ButtonButton(onTap: (){

                Navigator.pop(context);
              },buttonText: "Re-CALCULATE",),



            ],), onPress: () {

          },))

        ],
      )


    );
  }
}
