import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../model/user_model.dart';

class GetService {
  static var box = GetStorage();

  static void storeUser(User user) async{
    box.write('user', user.toJson());

  }
  static User? loadUser (){
    Map<String, dynamic>? userString = box.read('user');
    if (userString == null) {
      return null;
    }
    User? user = User.fromJson(userString);
    return user;
  }
  static void removeUser (){
    box.remove('user');
  }

}