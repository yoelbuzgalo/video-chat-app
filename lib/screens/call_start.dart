import 'package:flutter/material.dart';
import 'package:video_call_test/constants.dart';
import 'package:video_call_test/models/user_credential.dart';

class CallStart extends StatelessWidget {
  static const String id = 'CallStart';

  CallStart({Key? key}) : super(key: key);
  final UserCredential currentUser = new UserCredential();
  @override
  Widget build(BuildContext context) {
    print(currentUser.getUid);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: AppColor.navyBlue,
              child: IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: 'Menu',
                icon: const Icon(
                  Icons.person,
                ),
              ),
            ),
          );
        }),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
            ),
            ListTile(
              title: Text('Option 1'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Text('Hello'),
          Text('Player name'),
        ],
      ),
    );
  }
}
