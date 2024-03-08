import 'package:flutter/cupertino.dart';
import '../models/user.dart';

class userProvider with ChangeNotifier {
  User _user = User(id: '',
      name: '',
      email: '',
      token: '',
      password: '',
  );

  User get user => _user;

  void setUser(String user){
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user){
    _user = user;
    notifyListeners();
  }
}