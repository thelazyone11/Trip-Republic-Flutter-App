import 'package:flutter/material.dart';

import 'package:tourist_helper/widget/autoslideabletop.dart';
import 'package:tourist_helper/widget/home_cardview.dart';
import 'package:tourist_helper/widget/home_cardview_circuler.dart';
import 'package:tourist_helper/widget/other_service.dart';
import 'package:tourist_helper/widget/searchbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            Column(
              children: [
                HomeTop(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                SearchBar()
              ],
            ),
          ]),
          HomeCardViewCirculer(
            categoryName: "States",
          ),
          HomeCardView(
            categoryName: "Best Destination",
          ),
          OurServices()
        ],
      ),
    );
  }
}
