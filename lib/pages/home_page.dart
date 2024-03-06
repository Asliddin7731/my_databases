import 'package:flutter/material.dart';
import 'package:my_databases/model/user_model.dart';
import 'package:my_databases/service/get_service.dart';
import 'package:my_databases/service/hive_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String load = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              color: Colors.grey[200],
              height: 100,
              width: double.infinity,
              child: Text(load, style: const TextStyle(color: Colors.black87, fontSize: 20),
              ),
            ),
            MaterialButton(
              height: 50,
              minWidth: 150,
              color: Colors.greenAccent,
              child: const Text('Save User'),
                onPressed: (){
                var user = User('asliddin@gmail.com', '4455llk');
                // HiveService.storeUser(user);
                GetService.storeUser(user);
                load = '${user.toJson().toString()} **Save';
                setState(() {});
                }
            ),
            const SizedBox(height: 10),
            MaterialButton(
                height: 50,
                minWidth: 150,
                color: Colors.orangeAccent,
                child: const Text('Load User'),
                onPressed: (){
                  var user = GetService.loadUser();
                  if (user == null) {
                    load = "null";
                  } else {
                    load = '${user.toJson().toString()}  **Load';
                  }
                  setState(() {});
                }
            ),
            const SizedBox(height: 10),
            MaterialButton(
                height: 50,
                minWidth: 150,
                color: Colors.redAccent,
                child: const Text('Remove User'),
                onPressed: (){
                  GetService.removeUser();
                  load = 'remove';
                  setState(() {});
                }
            ),
          ],
        ),
      ),
    );
  }
}
