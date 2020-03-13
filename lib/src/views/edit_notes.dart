
import 'package:flutter/material.dart';

import '../controller/dbHelpers.dart';
import 'notes_list.dart';


class EditNote extends StatefulWidget {

  final List list;
  final int index;

  EditNote({this.list, this.index});

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {

  DbHelper dbHelper = new DbHelper();

  TextEditingController controllerDetail;
  TextEditingController controllerTitle;
  TextEditingController controllerId;

  @override
  void initState() { 

    controllerId= new TextEditingController(text: widget.list[widget.index]['_id'].toString() );
    controllerTitle= new TextEditingController(text: widget.list[widget.index]['title'].toString() );
    controllerDetail= new TextEditingController(text: widget.list[widget.index]['detail'].toString() );
    super.initState();
    
  }



  @override
  Widget build(BuildContext context) {
   return new Scaffold(
      appBar: new AppBar(
        title: new Text("Note Düzenle"),
      ),
      body: Form(       
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerId,
                          validator: (value) {
                            if (value.isEmpty) return "ID";
                          },
                      decoration: new InputDecoration(
                        hintText: "Id", labelText: "Id",
                      ),
                    ),
                  ),
                 new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerTitle,
                          validator: (value) {
                            if (value.isEmpty) return "name";
                          },
                      decoration: new InputDecoration(
                        hintText: "Name", labelText: "Name",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerDetail,
                          validator: (value) {
                            if (value.isEmpty) return "Price";
                          },
                      decoration: new InputDecoration(
                        hintText: "Price", labelText: "Price",
                      ),
                    ),
                  ),
                
                  const Divider(
                    height: 1.0,
                  ),                                    
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  new RaisedButton(
                    child: new Text("Güncelle"),
                    color: Colors.blueAccent,
                    onPressed: (){
                    dbHelper.editarNote(
                        controllerId.text.trim(), controllerTitle.text.trim(), controllerDetail.text.trim());
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new NotesList(),
                        )
                    );
                  },
                  )
                ],
              ),
            ],
          ),
      ),
    );
  }
}