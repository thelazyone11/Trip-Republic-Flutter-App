import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:tourist_helper/auth/login/login_page.dart';
import 'package:tourist_helper/provider/hotel_api.dart';

import 'package:tourist_helper/provider/places.dart';
import 'package:tourist_helper/provider/user%20/user_model.dart';

import 'package:tourist_helper/screen/accomodation_screen.dart';
import 'package:tourist_helper/screen/explor_screen.dart';

import 'package:tourist_helper/screen/place_detail_screen.dart';

import 'package:tourist_helper/screen/see_all_screen.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:tourist_helper/screen/profile_screen.dart';
import 'package:tourist_helper/screen/homepage.dart';
import 'package:tourist_helper/screen/fav_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Places(),
        ),
        ChangeNotifierProvider.value(
          value: UserModel(),
        ),
        ChangeNotifierProvider.value(
          value: HotelApi(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tourist App',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Iconsolata',
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Iconsolata',
        ),

        home: LoginPage(), //RootPage(),
        routes: {
          RootPage.routeName: (ctx) => RootPage(),
          LoginPage.routeName: (ctx) => LoginPage(),
          PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
          SeeAllScreen.routeName: (ctx) => SeeAllScreen(),
          AccoodationScreen.routeName: (ctx) => AccoodationScreen(),
          ExplorScreen.routeName: (ctx) => ExplorScreen(),
        },
      ),
    );
  }
}

class RootPage extends StatefulWidget {
  static const routeName = '/rootpage-screen';
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  final List<Widget> selectedScreen = [
    HomePage(),
    FavScreen(),
    ProfileScreen(),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      body: selectedScreen[_selectedIndex],
      // FutureBuilder(
      //   future: Provider.of<Places>(context).getData(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState != ConnectionState.done)
      //       return Center(child: CircularProgressIndicator());

      //     //load null data UI
      //     if (!snapshot.hasData || snapshot.data == null) return Container();

      //     //load empty data UI
      //     if (snapshot.data.isEmpty) return Container();

      //     return ;
      //   },
      // ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: darkModeOn ? Colors.black54 : Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
            ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                    backgroundColor: Colors.lightBlue,
                  ),
                  GButton(
                    icon: Icons.favorite_border,
                    text: 'Likes',
                    backgroundColor: Colors.pink,
                  ),
                  GButton(
                    icon: Icons.person_outline,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
