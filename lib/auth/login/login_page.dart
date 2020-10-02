import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:tourist_helper/provider/places.dart';
import 'package:tourist_helper/provider/user%20/user_model.dart';
import 'package:tourist_helper/screen/loading_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/loginpage-screen';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isUserSignedIn = false;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showSnack(BuildContext ctx) {
    final snackBar = SnackBar(
        backgroundColor: Colors.grey[800],
        content: Text('Try sign with Google'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    initApp();
  }

  void initApp() async {
    FirebaseApp defaultApp = await Firebase.initializeApp();
    _auth = FirebaseAuth.instanceFor(app: defaultApp);

    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();

    if (userSignedIn) {
      User user = _auth.currentUser;
      Provider.of<UserModel>(context, listen: false).getUser(user);
    }

    setState(() {
      isUserSignedIn = userSignedIn;
    });
  }

  Future<User> _handleSignIn() async {
    User user;
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
      user = _auth.currentUser;
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
      userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }

    return user;
  }

  void onGooglesignIn(BuildContext context) async {
    User user = await _handleSignIn();

    setState(() {
      isUserSignedIn = true;
    });
    Provider.of<UserModel>(context, listen: false).getUser(user);
  }

  bool startProgress = false;

  Future<bool> _onBackPress() {
    setState(() {
      startProgress = false;
    });

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Do you want to exit!"),
            content: Text("Are you sure?"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("No")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("Yes"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return isUserSignedIn
        ? FutureBuilder(
            future: Provider.of<Places>(context).getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return Center(child: CircularProgressIndicator());

              //load null data UI
              if (!snapshot.hasData || snapshot.data == null)
                return Container();

              //load empty data UI
              if (snapshot.data.isEmpty) return Container();

              return LoadingPage();
            },
          )

        //RootPage()
        : WillPopScope(
            onWillPop: _onBackPress,
            child: Scaffold(
              key: _scaffoldKey,
              body: Center(
                child: startProgress
                    ? CircularProgressIndicator()
                    : Stack(
                        children: [
                          Container(
                            color: Colors.black38,
                            height: MediaQuery.of(context).size.height / 2,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/login_back.jpg',
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            color: Colors.black38,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height / 2 - 50,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Text(
                                "WelCome to",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2,
                              width: double.infinity,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 20),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: GestureDetector(
                                        onTap: () {
                                          onGooglesignIn(context);
                                          setState(() {
                                            startProgress = true;
                                          });
                                        },
                                        child: Container(
                                          height: 40,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.2) -
                                              20,
                                          color: Colors.lightBlue,
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: CircleAvatar(
                                                  radius: 15,
                                                  backgroundImage: AssetImage(
                                                      "assets/google_logo.png"),
                                                ),
                                              ),
                                              Text('Login with Google',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          225, 225, 225, 1))),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: GestureDetector(
                                        onTap: () => _showSnack(context),
                                        child: Container(
                                          height: 40,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.2) -
                                              20,
                                          color:
                                              Color.fromRGBO(66, 103, 178, 1),
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: CircleAvatar(
                                                  radius: 15,
                                                  backgroundImage: AssetImage(
                                                      "assets/fb_logo.png"),
                                                ),
                                              ),
                                              Text(
                                                'Login with Facebook',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        225, 225, 225, 1)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height / 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Text(
                                "Trip Republic",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange),
                              ),
                            ),
                          ),
                          // Positioned(
                          //   top: MediaQuery.of(context).size.height / 1.1,

                          //   child:
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Made with",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red[900],
                                    ),
                                  ),
                                  Text(
                                    "in India",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // ),
                        ],
                      ),
              ),
            ),
          );
  }
}
