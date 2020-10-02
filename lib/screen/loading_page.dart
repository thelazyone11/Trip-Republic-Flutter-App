import 'package:flutter/material.dart';
import '../main.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RootPage.routeName, (Route<dynamic> route) => false);
    });

    return Center(child: CircularProgressIndicator());
  }
}
