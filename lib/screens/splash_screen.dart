import 'package:bidding_app/providers/theme_changer_provider.dart';
import 'package:bidding_app/screens/login_screen.dart';
import 'package:bidding_app/screens/login_screen.dart';
import 'package:bidding_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _pushToLogin(int seconds) {
    Future.delayed(Duration(seconds: seconds), () {
      Navigator.pushReplacementNamed(context, LoginScreen.id);
    });
  }

  @override
  void initState() {
    super.initState();
    // _pushToLogin(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('test'),
      //   actions: <Widget>[
      //     IconButton(
      //         icon: Icon(Icons.brightness_6),
      //         onPressed: () {
      //           print('pressed');
      //           Provider.of<ThemeChangerProvider>(context, listen: false)
      //               .swapTheme();
      //         })
      //   ],
      // ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(child: Lottie.asset('assets/animation/turning_coin.json')),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Text(
              'Bidding App',
              style: TextStyle(
                fontSize: 36.0,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
