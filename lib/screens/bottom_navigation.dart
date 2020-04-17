import 'package:bidding_app/providers/theme_changer_provider.dart';
import 'package:bidding_app/screens/bidding_screen.dart';
import 'package:bidding_app/screens/home_screen.dart';
import 'package:bidding_app/screens/infinity_screen.dart';
import 'package:bidding_app/screens/message_screen.dart';
import 'package:bidding_app/screens/profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigation extends StatefulWidget {
  static String id = 'bottom_navigation_screen';
  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _currentPage = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _allPages = [
    HomeScreen(),
    InfinityScreen(),
    BiddingScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var curvedNavigationBar = CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 50.0,
      items: <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.all_inclusive, size: 30),
        Icon(Icons.attach_money, size: 30),
        Icon(Icons.message, size: 30),
        Icon(Icons.account_circle, size: 30),
      ],
      animationCurve: Curves.easeInOut,
      backgroundColor: Theme.of(context).backgroundColor,
      buttonBackgroundColor: Theme.of(context).primaryColor,
      color: Theme.of(context).primaryColor,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeChangerProvider>(context, listen: false)
                  .swapTheme();
            }),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBarWidget(scaffoldKey: _scaffoldKey),
              Container(
                child: _allPages[_currentPage],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: curvedNavigationBar,
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
          child: Icon(Icons.more_horiz),
          // child: SvgPicture.asset(
          //   'assets/svg/menu.svg',
          //   color: Colors.white,
          // ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            size: 30.0,
          ),
        ),
      ],
    );
  }
}
