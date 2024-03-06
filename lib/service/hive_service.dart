import 'package:hive/hive.dart';

import '../model/user_model.dart';

class HiveService {
  static var box = Hive.box('MyDatabase');

  static void storeUser (User user){
    box.put('user', user.toJson());
  }

  static  User loadUser (){
    var user = User.fromJson(box.get('user'));
    return user;
  }

  static void removeUser () async{
    box.delete('user');
  }

}