import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UserModel with ChangeNotifier {
  User user;
  void getUser(User loggedUser) async {
    user = loggedUser;
    print(user.displayName);
  }

  userDetail() {
    final UserDetail userDetail =
        UserDetail(userName: user.displayName, userImg: user.photoURL);
    return userDetail;
  }
}

class UserDetail {
  final String userName;
  final String userImg;

  UserDetail({this.userImg, this.userName});
}
