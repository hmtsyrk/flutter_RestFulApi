import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DbHelper {
  var _status;
  var _token;
  String serverUrlNotes="http://localhost:3000/notes";

// getData fonksiyonu
  Future<List> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = "token";
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrlNotes";
    http.Response response = await http.get(myUrl, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $value"
    });
    return json.decode(response.body);
  }

  // kullanıcı kaydı fonksiyonu
  void addDataNotes(String _titleController, String _detailController) async {
    final prefs = await SharedPreferences.getInstance();
    final key = "token";
    final value = prefs.get(key) ?? 0;

    // url
    String _myUrl = "$serverUrlNotes";
    final response = await http.post(_myUrl, headers: {
      "Accept": "application/json",
    }, body: {
      "title": "$_titleController",
      "detail": "$_detailController",
    });
    var status = response.body.contains("error");
    var data = json.decode(response.body);

    if (status) {
      print("data : ${data['error']}");
    } else {
      print("data : ${data['token']}");
      _save(data["token"]);
    }
  }

    // güncelleme fonksiyonu
  void editarNote(String _id, String title, String detail) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "http://localhost:3000/note/$_id";
    http.put(myUrl,
        body: {
         "title":       "$title",
         "detail":       "$detail",
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }


  Future<void> removeRegister(String _id) async {

  String myUrl = "http://localhost:3000/note/$_id";

  Response res = await http.delete("$myUrl");

  if (res.statusCode == 200) {
    print("DELETED");
  } else {
    throw "Kayıt silinemedi";
  }
}

  //_save fonksiyonu
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = "token";
    final value = prefs.get(key) ?? 0;
    prefs.setString(key, value);
  }

  // read fonksiyonu
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = "token";
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
