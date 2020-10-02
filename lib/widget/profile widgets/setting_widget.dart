import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

class SettingWidget extends StatefulWidget {
  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  _googleLogOut() async {
    await _googleSignIn.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/loginpage-screen',
      (Route<dynamic> route) => false,
    );
  }

  void _signOut() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Sign Out!"),
            content: Text("Are you sure?"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("No")),
              FlatButton(
                  onPressed: () {
                    _googleLogOut();
                    Navigator.of(context)
                        .popUntil(ModalRoute.withName('/loginpage-screen'));
                  },
                  child: Text("Yes"))
            ],
          );
        });
  }

  void legal() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Legal"),
            content: Text(
                "All the images that used in this application is taken from the Inernet."),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("Okay")),
            ],
          );
        });
  }

  void _showSnak() {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('This Feature Not Implemented Yet'),
      duration: Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
          child: GestureDetector(
            onTap: _showSnak,
            child: Container(
              height: 60,
              color: darkModeOn ? Colors.black38 : Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.book), Text("Your Booking")],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
          child: GestureDetector(
            onTap: _showSnak,
            child: Container(
              height: 60,
              color: darkModeOn ? Colors.black38 : Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.featured_play_list),
                      Text("Wishlist")
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
          child: GestureDetector(
            onTap: _showSnak,
            child: Container(
              height: 60,
              color: darkModeOn ? Colors.black38 : Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.settings), Text("Setting")],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
          child: GestureDetector(
            onTap: _showSnak,
            child: Container(
              height: 60,
              color: darkModeOn ? Colors.black38 : Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.perm_contact_calendar),
                      Text("Help and Contact")
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
          child: GestureDetector(
            onTap: legal,
            child: Container(
              height: 60,
              color: darkModeOn ? Colors.black38 : Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.info), Text("Legal")],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
          child: GestureDetector(
            onTap: _signOut,
            child: Container(
              height: 60,
              color: darkModeOn ? Colors.black38 : Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.directions_walk), Text("Sign Out")],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
