import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/add_notes.dart';
import 'views/login_page.dart';
import 'views/notes_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NodeJs Restful",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false);
            },
            child: Text("Çıkış",
                style: TextStyle(
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Center(
        child: Text("Home Page"),
      ),
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("NodeJS"),
              accountEmail: new Text("deneme@gmail.com"),
            ),
            new ListTile(
              title: new Text("Notları Listele"),
              trailing: new Icon(Icons.list),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context)=>NotesList(),
              )),
            ),
           
            new ListTile(
              title: new Text("Not Ekle"),
              trailing: new Icon(Icons.headset),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context)=>AddDataNote(),
              )),
            ),
            new ListTile(
              title: new Text("Hesabım"),
              trailing: new Icon(Icons.account_box),
              onTap: () {},
            ),
            new ListTile(
              title: new Text("Ayarlar"),
              trailing: new Icon(Icons.settings),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
