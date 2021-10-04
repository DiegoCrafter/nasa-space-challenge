
import 'package:covid_19/login.dart';
import 'package:covid_19/widgets/data_onb.dart';
import 'package:covid_19/widgets/intro_screen.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  final List<OnbordingData> list = [
    OnbordingData(
      imagePath: "assets/images/vacunate.png",
      title: "Bienvenido",
      desc:
          "",
    ),
    OnbordingData(
      imagePath: "assets/images/vacunate.png",
      title: "Este siempre informado",
      desc:
          "Reciba notificaciones rápidamente si ha estado expuesto a covid 19",
    ),
    OnbordingData(
      imagePath: "assets/images/vacunate.png",
      title: "Este seguro",
      desc:
          "Una nueva normalidad segura con todos nosotros.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreen(
      list,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }
}