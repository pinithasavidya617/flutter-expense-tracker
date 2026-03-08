import 'package:flutter/material.dart';
import 'package:money_manage/configs/size_config.dart';
import 'package:money_manage/screens/home_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    final double circleSize = SizeConfig.blockWidth * 70;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: SizeConfig.blockHeight * 13),
                child: Column(
                  children: [
                    Container(
                      height: circleSize,
                      width: circleSize,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFf3eefb)),
                      child: Center(
                          child: Image.asset(
                        'assets/images/wallet.png',
                        width: SizeConfig.blockWidth * 50,
                      )),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: SizeConfig.blockHeight * 5),
                  child: Text(
                    "Save your money",
                    style: TextStyle(
                        fontSize: SizeConfig.blockWidth * 9,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff565761),
                        fontStyle: FontStyle.normal),
                  ),
                ),
                Text(
                  "with Expense Tracker",
                  style: TextStyle(
                      fontSize: SizeConfig.blockWidth * 9,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff565761),
                      fontStyle: FontStyle.normal),
                ),
                Container(
                  padding: EdgeInsets.only(top: SizeConfig.blockHeight * 2),
                  child: Text(
                      "Save money! The more your money\n"
                      "works for you, the less you have to work\n"
                      "for money",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: SizeConfig.blockWidth * 4,
                          color: Colors.grey,
                          height: 1.5)),
                ),
                SizedBox(
                  height: SizeConfig.blockHeight * 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(15)),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        child: Center(
                          child: Text("Let's Start",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.blockWidth * 5,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
