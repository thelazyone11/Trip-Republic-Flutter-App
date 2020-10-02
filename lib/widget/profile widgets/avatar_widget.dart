import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tourist_helper/provider/user%20/user_model.dart';

class AvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserDetail user = Provider.of<UserModel>(context).userDetail();
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.28,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(
                    user != null
                        ? user.userImg
                        : "https://www.iconfinder.com/data/icons/female-avatars-vol-1/256/female-portrait-avatar-profile-woman-sexy-afro-2-512.png",
                    //,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
              child: Text(
                user != null ? user.userName : "john Wick",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(color: Colors.black)
          ],
        ),
      ),
    );
  }
}
