import 'package:flutter/material.dart';
import 'package:tourist_helper/widget/profile%20widgets/avatar_widget.dart';
import 'package:tourist_helper/widget/profile%20widgets/setting_widget.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvatarWidget(),
        SettingWidget(),
        Fotter(),
      ],
    );
  }
}

class Fotter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Text("App version 1.0.0-relase(20)"),
          ),
        ),
      ),
    );
  }
}
