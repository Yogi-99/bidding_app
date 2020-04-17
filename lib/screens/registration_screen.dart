import 'package:bidding_app/animations/fade_animation.dart';
import 'package:bidding_app/providers/theme_changer_provider.dart';
import 'package:bidding_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  static String id = 'register_screen';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _formKey,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.brightness_6),
                      onPressed: () {
                        Provider.of<ThemeChangerProvider>(context,
                                listen: false)
                            .swapTheme();
                      }),
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Provider.of<ThemeChangerProvider>(context)
                                    .isDark
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Positioned(
                    child: FadeAnimation(
                      2,
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: <Widget>[
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
                                    InputTextField(
                                      isObscure: false,
                                      hintText: 'Username',
                                      inputType: TextInputType.text,
                                      onTextChange: (value) {},
                                    ),
                                    InputTextField(
                                      isObscure: false,
                                      hintText: 'Email Address',
                                      inputType: TextInputType.emailAddress,
                                      onTextChange: (value) {},
                                    ),
                                    InputTextField(
                                      isObscure: false,
                                      hintText: 'Full Name',
                                      inputType: TextInputType.text,
                                      onTextChange: (value) {},
                                    ),
                                    InputTextField(
                                      isObscure: true,
                                      hintText: 'Password',
                                      inputType: TextInputType.emailAddress,
                                      onTextChange: (value) {},
                                    ),
                                    InputTextField(
                                      isObscure: true,
                                      hintText: 'Confirm Password',
                                      inputType: TextInputType.emailAddress,
                                      onTextChange: (value) {},
                                    ),
                                    InputTextField(
                                      isObscure: false,
                                      hintText: 'Contact Number',
                                      inputType: TextInputType.number,
                                      onTextChange: (value) {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // top: 0.0,
                    child: Center(
                        child: CircleAvatar(
                      radius: 30.0,
                      child: Icon(
                        Icons.add,
                        size: 30.0,
                      ),
                    )),
                  ),
                ],
              ),
              // Spacer(),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: FadeAnimation(
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
                        "Register",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              // Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an Accounr?",
                    style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  final String hintText;
  final bool isObscure;
  final TextInputType inputType;
  final Function onTextChange;
  final validator;

  InputTextField({
    Key key,
    this.hintText,
    this.isObscure,
    this.validator,
    this.inputType,
    this.onTextChange,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[100]))),
      child: TextFormField(
        validator: validator,
        obscureText: isObscure,
        keyboardType: inputType,
        onChanged: onTextChange,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }
}
