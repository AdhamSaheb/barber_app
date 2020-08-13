import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
          title: "Hello There ! ",
          styleTitle: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          description:
              "Starting now, getting a haircut has become a lot easier !",
          pathImage: "Images/barber2.png",
          backgroundColor: Colors.white,
          widthImage: 300,
          heightImage: 300),
    );
    slides.add(
      new Slide(
          title: "Reserve",
          description: "Pick your spot with your barber !",
          styleTitle: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          pathImage: "Images/booking.png",
          backgroundColor: Colors.white,
          widthImage: 300,
          heightImage: 300),
    );
    slides.add(
      new Slide(
          title: "Wait For Approval",
          description:
              'Wait for your barber to confirm your reservation with a text message !',
          styleTitle: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          pathImage: "Images/waiting.png",
          backgroundColor: Colors.white,
          widthImage: 300,
          heightImage: 300),
    );
    slides.add(
      new Slide(
          title: "Let\'s Get Started !",
          pathImage: "Images/character4.png",
          styleTitle: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          backgroundColor: Colors.white,
          widthImage: 300,
          heightImage: 300),
    );
  }

  void onDonePress() {
    Navigator.pushReplacementNamed(context, '/wrapper');
  }

  Widget renderNextBtn() {
    return Text(
      'Next',
      style: TextStyle(color: Colors.black),
    );
  }

  Widget renderDoneBtn() {
    return Text(
      'Let\'s Go !',
      style: TextStyle(color: Colors.black),
    );
  }

  Widget renderSkipBtn() {
    return Text(
      'Skip',
      style: TextStyle(color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
    );
  }
}
