import 'package:covid_19/constant.dart';
import 'package:covid_19/data_dash/info_details.dart';
import 'package:covid_19/map/maps.dart';
import 'package:covid_19/qr/qr_code.dart';
import 'package:covid_19/widgets/counter.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:covid_19/widgets/prevention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'info_card.dart';
import 'onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kuska Safe',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor),
          )),
      home: TestScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is stay at home.",
              offset: offset,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      "Recomendaciones",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          PreventitonCard(
                            svgSrc: "assets/icons/hand_wash.svg",
                            title: "Lavate las manos",
                          ),
                          SizedBox(width: 10),
                          PreventitonCard(
                            svgSrc: "assets/icons/use_mask.svg",
                            title: "Usa mascarilla",
                          ),
                          SizedBox(width: 10),
                          PreventitonCard(
                            svgSrc: "assets/icons/Clean_Disinfect.svg",
                            title: "Desinfectate",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 150,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                              // left side padding is 40% of total width
                              left: MediaQuery.of(context).size.width * .4,
                              top: 20,
                              right: 20,
                            ),
                            height: 130,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF60BE93),
                                  Color(0xFF1B8D59),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Llama al 113\n",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: "Si presentas sintomas",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: SvgPicture.asset("assets/icons/nurse.svg"),
                          ),
                          Positioned(
                            top: 30,
                            right: 10,
                            child: SvgPicture.asset("assets/icons/virus.svg"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Estado de salud",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 150,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                              // left side padding is 40% of total width
                              left: MediaQuery.of(context).size.width * .4,
                              top: 20,
                              right: 20,
                            ),
                            height: 130,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black,
                                  Colors.lightBlue,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Vacunado\n",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: "Pongamos nuestras manos al hombro",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                                height: 110,
                                child:
                                    Image.asset("assets/images/vacunate.png")),
                          ),
                          Positioned(
                            top: 30,
                            right: 10,
                            child: Icon(Icons.check, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Check In",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => QRBarcodeScreen()));
                      },
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                // left side padding is 40% of total width
                                left: MediaQuery.of(context).size.width * .4,
                                top: 20,
                                right: 20,
                              ),
                              height: 130,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.grey,
                                    Colors.yellow,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Escanea\n",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: "El codigo QR",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                  height: 110,
                                  child: Image.asset("assets/images/qr.png")),
                            ),
                            Positioned(
                              top: 30,
                              right: 10,
                              child: Icon(Icons.check, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Georeference",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MapsScreen()));
                      },
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                // left side padding is 40% of total width
                                left: MediaQuery.of(context).size.width * .4,
                                top: 20,
                                right: 20,
                              ),
                              height: 130,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.grey,
                                    Colors.deepPurple,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Geolocation\n",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: "See the spread",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                  height: 110,
                                  child: Icon(
                                    Icons.map,
                                    color: Colors.white,
                                    size: 55,
                                  )),
                            ),
                            Positioned(
                              top: 30,
                              right: 10,
                              child: Icon(Icons.check, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.03),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: <Widget>[
                    InfoCard(
                      title: "Cases confirmados",
                      iconColor: Color(0xFFFF8C00),
                      effectedNum: 1062,
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => InfoDetails()));
                      },
                    ),
                    InfoCard(
                      title: "Muertes totales",
                      iconColor: Color(0xFFFF2D55),
                      effectedNum: 75,
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => InfoDetails()));
                      },
                    ),
                    InfoCard(
                      title: "Recuperadas",
                      iconColor: Color(0xFF50E3C2),
                      effectedNum: 689,
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => MapsScreen()));
                      },
                    ),
                    InfoCard(
                      title: "Nuevos casos",
                      iconColor: Color(0xFF5856D6),
                      effectedNum: 75,
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => InfoDetails()));
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
