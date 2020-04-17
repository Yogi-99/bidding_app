import 'package:bidding_app/providers/theme_changer_provider.dart';
import 'package:bidding_app/screens/bidding_screen.dart';
import 'package:bidding_app/screens/bottom_navigation.dart';
import 'package:bidding_app/screens/home_screen.dart';
import 'package:bidding_app/screens/infinity_screen.dart';
import 'package:bidding_app/screens/login_screen.dart';
import 'package:bidding_app/screens/message_screen.dart';
import 'package:bidding_app/screens/profile_screen.dart';
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
      initialRoute: CustomBottomNavigation.id,
      theme: themeData,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        MessageScreen.id: (context) => MessageScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        InfinityScreen.id: (context) => InfinityScreen(),
        BiddingScreen.id: (context) => BiddingScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        CustomBottomNavigation.id: (context) => CustomBottomNavigation(),
      },
    );
  }
}
