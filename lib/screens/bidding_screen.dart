import 'package:flutter/material.dart';

class BiddingScreen extends StatelessWidget {
  static String id = 'bidding_screen';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Bidding Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
