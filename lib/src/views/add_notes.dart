import 'package:flutter/material.dart';

import '../controller/dbHelpers.dart';
import '../home_page.dart';

class AddDataNote extends StatefulWidget {

  AddDataNote({Key key , this.title}) : super(key : key);
  final String title;

  @override
  _AddDataNoteState createState() => _AddDataNoteState();
}

class _AddDataNoteState extends State<AddDataNote> {

  DbHelper dbHelper = new DbHelper();


  final TextEditingController _titleController = new TextEditingController();  
  final TextEditingController _detailController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not Ekle',
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Not Ekle'),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
            children: <Widget>[
              
              Container(
                height: 50,
                child: new TextField(
                  controller: _titleController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Başlık',
                    // hintText: 'Başlık',
                    icon: new Icon(Icons.title),
                  ),
                ),
              ),

              Container(
                height: 50,
                child: new TextField(
                  controller: _detailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Detay',
                    // hintText: 'Lütfen açıklama giriniz',
                    icon: new Icon(Icons.details),
                  ),
                ),
              ),
              
              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              // Container(
              //   height: 50,
              //   child: new TextField(
              //     controller: _stockController,
              //     keyboardType: TextInputType.text,
              //     decoration: InputDecoration(
              //       labelText: 'stock',
              //       hintText: 'Place your stock',
              //       icon: new Icon(Icons.vpn_key),
              //     ),
              //   ),
              // ),
             new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: (){

                    dbHelper.addDataNotes(
                        _titleController.text.trim(), _detailController.text.trim());
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new HomePage(),
                        )
                    );
                  },
                  color: Colors.blue,
                  child: new Text(
                    'Ekle',
                    style: new TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.blue),),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }



}