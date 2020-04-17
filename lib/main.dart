import 'package:bidding_app/providers/theme_changer_provider.dart';
import 'package:bidding_app/screens/login_screen.dart';
import 'package:bidding_app/screens/registration_screen.dart';
import 'package:bidding_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChangerProvider>(
            create: (_) => ThemeChangerProvider(isDarkMode: true))
      ],
      child: MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Provider.of<ThemeChangerProvider>(context).getTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bidding App',
      initialRoute: LoginScreen.id,
      theme: themeData,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
      },
    );
  }
}
