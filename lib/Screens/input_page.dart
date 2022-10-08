// ignore_for_file: camel_case_types, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Component/icon_content.dart';
import '../Component/reusable_card.dart';
import '../Component/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/Component/OwnButton.dart';
import 'package:bmi_calculator/Component/button_button.dart';
import 'package:bmi_calculator/bmi_brain.dart';


enum Gender { female, male }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender=Gender.male;
  int height=180;
  int weight=60;
  int age=25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A0E21),
          title: const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(children: [
                Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          gender=Gender.male;
                        });
                      },
                        color: gender == Gender.male
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        cardWidget: const IconContent(
                            icon: FontAwesomeIcons.mars, name: "Male"))),
                Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                        color: gender == Gender.female
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        cardWidget: const IconContent(
                            icon: FontAwesomeIcons.venus,
                            name: "Female"))),
              ]),
            ),
            Expanded(
                child: ReusableCard(
              color: kActiveCardColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>
              [
                const Text("Height",style: kTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),style: kTextStyleHeavy,),
                    const Text("cm",style: kTextStyle,)
                  ],
                ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor:const Color(0x29EB1555),
                      thumbColor: Colors.pink,
                    ),
                    child: Slider(value: height.toDouble(), min: kMinHeight.toDouble(),max:kMaxHeight.toDouble(),
                        onChanged:(double newValue){
                      setState(() {
                        height=newValue.round();
                      });



                    }),
                  )
              ],), onPress: (){}
            )),
            Expanded(
              child: Row(
                  children: [
                Expanded(
                  child: ReusableCard(color: kActiveCardColor,
                      cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                    const Text('Weight',style: kTextStyle,),
                      Text(weight.toString(),style: kTextStyleHeavy,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ownButton(icon: FontAwesomeIcons.minus,onPressed:(){
                            setState(() {
                              weight--;
                            });
                          }
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ownButton(icon: FontAwesomeIcons.plus,onPressed:(){
                                     setState(() {
                                           weight++;
                                                    });

                                               },),



                        ],
                      )
                  ],), onPress: () {

                    },),
                ),
                Expanded(
                    child: ReusableCard(
                  color: kActiveCardColor,
                  cardWidget:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      const Text('Age',style: kTextStyle,),
                      Text(age.toString(),style: kTextStyleHeavy,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ownButton(icon: FontAwesomeIcons.minus,onPressed:(){
                            setState(() {
                              age--;
                            });
                          }
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ownButton(icon: FontAwesomeIcons.plus,onPressed:(){
                            setState(() {
                              age++;
                            });

                          },),



                        ],
                      )
                    ],), onPress: () {

                    },
                )),
              ]),
            ),
            ButtonButton(onTap:(){
              CalculateBrain calc=CalculateBrain( weight,height,);
              Navigator.push(context, MaterialPageRoute(builder:(context) => ResultsPage(
                bmiResults:calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
            },buttonText: "CALCULATE",)
          ],
        ));
  }


}

