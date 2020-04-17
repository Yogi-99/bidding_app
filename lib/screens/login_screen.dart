import 'package:bidding_app/animations/fade_animation.dart';
import 'package:bidding_app/providers/theme_changer_provider.dart';
import 'package:bidding_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'login_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    // height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          right: -50.0,
                          bottom: 70.0,
                          height: 225.0,
                          child: FadeAnimation(
                            3,
                            Container(
                              child: SvgPicture.asset(
                                'assets/svg/undraw_personal_finance_tqcd.svg',
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 10.0,
                            left: 10.0,
                            child: Container(
                              child: Center(
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.brightness_6,
                                        size: 30.0,
                                      ),
                                      onPressed: () {
                                        Provider.of<ThemeChangerProvider>(
                                                context,
                                                listen: false)
                                            .swapTheme();
                                      })),
                            )),
                        Positioned(
                            top: 15.0,
                            right: 20.0,
                            child: FadeAnimation(
                              1,
                              Container(
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40.0),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                          2,
                          Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:
                                  Provider.of<ThemeChangerProvider>(context)
                                          .isDark
                                      ? null
                                      : [
                                          BoxShadow(
                                            color: Color.fromRGBO(
                                                143, 148, 251, 0.4),
                                            blurRadius: 20.0,
                                            offset: Offset(0, 10),
                                          )
                                        ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email or Phone number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        FadeAnimation(
                          2.5,
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, RegisterScreen.id);
                              },
                              child: Text(
                                "Sign Up?",
                                style: TextStyle(
                                    color: Color.fromRGBO(143, 148, 251, 1)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
